string Description = "This shader adds a glow effect to all objects in the scene";
string Thumbnail = "Bloom.png";

float2 ViewSize : ViewSize;

float MinEdgeLimit
<
	string UIWidget = "slider";
	float UIMax = 1.0;
	float UIMin = 0.0;
	float UIStep = 0.01;
> = 0.600000;

float MaxEdgeLimit
<
	string UIWidget = "slider";
	float UIMax = 1.0;
	float UIMin = 0.0;
	float UIStep = 0.01;
> = 1.000000;

float EdgeThickness
<
	string UIWidget = "slider";
	float UIMax = 3.0;
	float UIMin = 0.0;
	float UIStep = 0.01;
> = 0.400000;

//box filter, declare in pixel offsets convert to texel offsets in PS
float2 DownFilterSamples[9] =
{
    { -1,  -1 },
    { -1,  0  },
    { -1,  1  },
    { 0,   1  },
    { 1,   1  },
    { 1,   0  },
    { 1,   -1 },
    { 0,   -1 },
    { 0,   0  },
};

static const int FilterSize = 13;
float2 PixelOffsets [ FilterSize ] =
{
    { -6, 0 },
    { -5, 0 },
    { -4, 0 },
    { -3, 0 },
    { -2, 0 },
    { -1, 0 },
    {  0, 0 },
    {  1, 0 },
    {  2, 0 },
    {  3, 0 },
    {  4, 0 },
    {  5, 0 },
    {  6, 0 },
};

static const float BlurWeights [ FilterSize ] = 
{
    0.002216,
    0.008764,
    0.026995,
    0.064759,
    0.120985,
    0.176033,
    0.200496,
    0.176033,
    0.120985,
    0.064759,
    0.026995,
    0.008764,
    0.002216,
};

float2 EdgeOffsets[9] =
{
    { -1,  -1 },
    {  0,  -1  },
    {  1,  -1  },
    { -1,   0  },
    {  0,   0  },
    {  1,   0  },
    { -1,   1 },
    {  0,   1 },
    {  1,   1  },
};

float EdgeWeightsH[9] =
{
    1,  2,  1,
    0,  0,  0,
   -1, -2, -1
};

float EdgeWeightsV[9] =
{
   -1,  0,  1,
   -2,  0,  2,
   -1,  0,  1
};

float2 PixelKernel[FilterSize] =
{
    { -6, 0 },
    { -5, 0 },
    { -4, 0 },
    { -3, 0 },
    { -2, 0 },
    { -1, 0 },
    {  0, 0 },
    {  1, 0 },
    {  2, 0 },
    {  3, 0 },
    {  4, 0 },
    {  5, 0 },
    {  6, 0 },
};

float BloomScale 
<
	string UIWidget = "slider";
	float UIMax = 2.0;
	float UIMin = 0.0;
	float UIStep = 0.01;
> = 1.400000;

float BloomPower
<
	string UIWidget = "slider";
	float UIMax = 4.0;
	float UIMin = 0.4;
	float UIStep = 0.01;
> = 1.890000;

texture frameImg : RENDERCOLORTARGET
< 
	string ResourceName = "";
	float2 ViewportRatio = { 1.0, 1.0 };
>;

sampler2D frameImgSamp = sampler_state {
    Texture = < frameImg >;
    MinFilter = Linear; MagFilter = Linear; MipFilter = Linear;
    AddressU = Wrap; AddressV = Wrap;
};

texture EdgeImg : RENDERCOLORTARGET 
< 
	string ResourceName = ""; 
	float2 ViewportRatio = { 1.0, 1.0 };
>;

sampler2D EdgeSamp = sampler_state {
    Texture = < EdgeImg >;
    MinFilter = Linear; MagFilter = Linear; MipFilter = Linear;
    AddressU = Clamp; AddressV = Clamp;
};

//downsample image
texture Downsample1Img : RENDERCOLORTARGET 
< 
	string ResourceName = ""; 
	float2 ViewportRatio = { 0.5, 0.5 };
>;

sampler2D Downsample1Samp = sampler_state {
    Texture = < Downsample1Img >;
    MinFilter = Linear; MagFilter = Linear; MipFilter = Linear;
    AddressU = Clamp; AddressV = Clamp;
};

//downsmaple image2
texture Downsample2Img : RENDERCOLORTARGET 
< 
	string ResourceName = ""; 
	float2 ViewportRatio = { 0.25, 0.25 };
>;

sampler2D Downsample2Samp = sampler_state {
    Texture = < Downsample2Img >;
    MinFilter = Linear; MagFilter = Linear; MipFilter = Linear;
    AddressU = Clamp; AddressV = Clamp;
};

//blur image1
texture Blur1Img : RENDERCOLORTARGET 
< 
	string ResourceName = ""; 
	float2 ViewportRatio = { 0.25, 0.25 };
>;

sampler2D Blur1Samp = sampler_state {
    Texture = < Blur1Img >;
    MinFilter = Linear; MagFilter = Linear; MipFilter = Linear;
    AddressU = Clamp; AddressV = Clamp;
};

//blur image2
texture Blur2Img : RENDERCOLORTARGET 
< 
	string ResourceName = ""; 
	float2 ViewportRatio = { 0.25, 0.25 };
>;

sampler2D Blur2Samp = sampler_state {
    Texture = < Blur2Img >;
    MinFilter = Linear; MagFilter = Linear; MipFilter = Linear;
    AddressU = Clamp; AddressV = Clamp;
};

struct input 
{
	float4 pos : POSITION;
	float2 uv : TEXCOORD0;
};
 
struct output {

	float4 pos: POSITION;
	float2 uv: TEXCOORD0;

};

output VS( input IN ) 
{
	output OUT;

	//quad needs to be shifted by half a pixel.
    //Go here for more info: http://www.sjbrown.co.uk/?article=directx_texels
    
	float4 oPos = float4( IN.pos.xy + float2( -1.0f/ViewSize.x, 1.0f/ViewSize.y ),0.0,1.0 );
	OUT.pos = oPos;

	float2 uv = (IN.pos.xy + 1.0) / 2.0;
	uv.y = 1 - uv.y; 
	OUT.uv = uv;
	
	return OUT;	
}

float4 PSEdgeDetect( output IN, uniform sampler2D srcTex ) : COLOR
{
	float4 color=0;
	float4 edgeH = 0;
	float4 edgeV = 0;
	float2 scale = EdgeThickness/ViewSize;
	
	//Filter to find the horizontal and vertical edges
	for (int i = 0; i < 9; i++)
    {
    	float4 pixel = tex2D( srcTex, IN.uv + EdgeOffsets[i].xy*scale );
        edgeH += pixel*EdgeWeightsH[i];
        edgeV += pixel*EdgeWeightsV[i];
    }
    
    //convert the color changes to black and white
    edgeH.r = edgeH.r*0.30 + edgeH.g*0.59 + edgeH.b*0.11;
    edgeH.a = 1;
    
    edgeV.r = edgeV.r*0.30 + edgeV.g*0.59 + edgeV.b*0.11;
    edgeV.a = 1;
    
    //output the edges
    float edge = 1- saturate(abs(edgeH.r) + abs(edgeV.r));
    return edge;
}

float4 PSDownsample( output IN, uniform sampler2D srcTex, uniform float reduceRatio ) : COLOR
{
    float4 color = 0;
    float2 scale = reduceRatio/ViewSize;
    
    for (int i = 0; i < 9; i++)
    {
        //convert pixel offsets into texel offsets via the inverse view values.
        color += tex2D( srcTex, IN.uv + DownFilterSamples[i].xy*scale );
    }

    return color / 9;    
}
  
float4 PSBlurH( output IN, uniform sampler2D srcTex ) : COLOR 
{
    float4 color = 0;
   
    float2 scale = 1.0f/ViewSize;

    for (int i = 0; i < FilterSize; i++) {   
		//convert pixel offsets into texel offsets via the inverse view values. 
		color += tex2D( srcTex , IN.uv + PixelOffsets[i].xy*scale ) * BlurWeights[i];
    }

    return color;
}

float4 PSBlurV( output IN, uniform sampler2D srcTex ) : COLOR
{
    float4 color = 0;   
    float2 scale = 1.0f/ViewSize;

    for (int i = 0; i < FilterSize; i++) {  
		//convert pixel offsets into texel offsets via the inverse view values.  
		color += tex2D( srcTex, IN.uv + PixelOffsets[i].yx*scale ) * BlurWeights[i];
    }

    return color;
}

float4 PSCombine( input IN ) : COLOR 
{

    //take the texture with the edges, and limit according to chosen values
    float3 edge = tex2D( EdgeSamp, IN.uv ).rgb;
    edge = smoothstep(MinEdgeLimit,MaxEdgeLimit,edge);

    //take the blurred scene texture and blend it with the edge texture
    float3 color = tex2D( Downsample2Samp, IN.uv ).rgb;
    color = lerp( color, edge, 1-edge );
    
    color += pow(tex2D( Blur2Samp, IN.uv ),BloomPower) * BloomScale;

    return float4( color, 1.0f );      
}

technique Blur
<
	//specify the starting image where the original scene will be drawn
	string RenderColorTarget = "frameImg";
>
{

	//first pass downsample the image to quarter the size
	pass Downsample
	<
		string RenderColorTarget = "Downsample1Img";
	>
	{
		ZEnable = False;
		VertexShader = compile vs_1_1 VS();
		PixelShader = compile ps_2_0 PSDownsample( frameImgSamp, 0.25 );
	}

	//downsample the image smaller again
	pass Downsample2
	<
		string RenderColorTarget = "Downsample2Img";
	>
	{
		ZEnable = False;
		VertexShader = compile vs_1_1 VS();
		PixelShader = compile ps_2_0 PSDownsample( Downsample1Samp, 0.25 );
	}
	
	//blur this small image horizontally and save it in BlurImg1
	pass BlurH
	<
		string RenderColorTarget = "Blur1Img";
	>
	{
		ZEnable = False;
		VertexShader = compile vs_1_1 VS();
		PixelShader = compile ps_2_0 PSBlurH( Downsample2Samp );
	}
	
	//blur the image vertically and save it in BlurImg2
	pass BlurV
	<
		string RenderColorTarget = "Blur2Img";
	>
	{
		ZEnable = False;
		VertexShader = compile vs_1_1 VS();
		PixelShader = compile ps_2_0 PSBlurV( Blur1Samp );
	}
	
	//repeat the blur to get a larger glowing effect
	pass BlurH
	<
		string RenderColorTarget = "Blur1Img";
	>
	{
		ZEnable = False;
		VertexShader = compile vs_1_1 VS();
		PixelShader = compile ps_2_0 PSBlurH( Blur2Samp );
	}
	
	pass BlurV
	<
		string RenderColorTarget = "Blur2Img";
	>
	{
		ZEnable = False;
		VertexShader = compile vs_1_1 VS();
		PixelShader = compile ps_2_0 PSBlurV( Blur1Samp );
	}
	
	//pass to detect the edges in the scene and put them in the EdgeImg texture
	pass EdgeDetect
	<
		string RenderColorTarget = "EdgeImg";
	>
	{
		ZEnable = False;
		VertexShader = compile vs_1_1 VS();
		PixelShader = compile ps_2_0 PSEdgeDetect( frameImgSamp );
	}
	
	//combine the glow image with the original to achieve a bloom effect
	pass Combine
	<
		//blank target indicates this is the final pass and should be drawn to the final results image
		string RenderColorTarget = "";
	>
	{
		ZEnable = False;
		VertexShader = compile vs_1_1 VS();
		PixelShader = compile ps_2_0 PSCombine();
	}
}

//====================================================
// NormalMapping
//====================================================
// By Ben Cloward
// bsmji@hotmail.com
// www.monitorstudios.com/bcloward
//====================================================
// Modified by TheComet for DBP
//====================================================

//====================================================
// Untweakables
//====================================================

matrix world : World;
matrix worldIMatrix : WorldInverse;
matrix wvp : WorldViewProjection;

//====================================================
// Tweakables
//====================================================

float4 LightPosition : POSITION
<
	string UIName = "Light Position";
	string Object = "PointLight";
	string Space = "World";
	int refID = 0;
> = { 100.0f, 100.0f, 100.0f, 0.0f };

float4 lightColor : LIGHTCOLOR
<
	int LightRef = 0;
> = {1.0f, 1.0f, 1.0f, 0.0f };

float LightRange
<
	string UIName = "Light Range";
> = 50.0f;

float4 ambiColor : Ambient
<
	string UIName = "Ambient Color";
> = { 0.5f, 0.5f, 0.5f, 1.0f };

//====================================================
// Textures
//====================================================

texture diffuseTexture : DiffuseMap
<
	string name = "";
	string UIName = "Diffuse Texture";
>;

texture normalMap : NormalMap
<
	string name = "";
	string UIName = "Normal Texture";
>;

sampler2D cmap = sampler_state
{
	Texture = <diffuseTexture>;
	MinFilter = Linear;
	MagFilter = Linear;
	MipFilter = Linear;
};

sampler2D normalSampler = sampler_state
{
	Texture = <normalMap>;
	MinFilter = Linear;
	MagFilter = Linear;
	MipFilter = Linear;
};

//====================================================
// Structs
//====================================================

struct VertexIn
{
	float4 Position		: POSITION;
	float2 UV			: TEXCOORD;
	float3 Normal		: NORMAL;
	float3 T			: TANGENT;
	float3 B			: BINORMAL;
};

struct VertexOut
{
	float4 HPosition	: POSITION;
	float2 texCoord0	: TEXCOORD0;
	float3 LightVector	: TEXCOORD1;
};

struct PixelOut
{
	float4 col : COLOR;
};

//====================================================
// Vertex Shader
//====================================================

VertexOut DiffuseBumpVS( VertexIn IN )
{

	// create the vertex out struct
	VertexOut OUT;
	
	// pass coordinates for maps
	OUT.texCoord0 = IN.UV;

	// compute the 3x3 transform from tangent space to object space
	float3x3 objToTangentSpace;
	objToTangentSpace[0] = IN.B;
	objToTangentSpace[1] = -IN.T;
	objToTangentSpace[2] = IN.Normal;
	
	// put the vert position in world space
	float4 worldSpacePos = mul(IN.Position, world);
	
	// cast a ray to the light
	float4 normLightVec = LightPosition - worldSpacePos;
	
	// transform the light vector to object space
	float3 objnormLightVec = normalize(mul(normLightVec, worldIMatrix).xyz);
	
	// transform light vector from object space to tangent space and pass it as a color
	OUT.LightVector = 0.5 * mul(objToTangentSpace, objnormLightVec) + 0.5;
	
	// transform position to projection space
	OUT.HPosition = mul(IN.Position, wvp);

	return OUT;
}

//====================================================
// Pixel Shader
//====================================================

PixelOut DiffuseBumpPS( VertexOut IN,
	uniform sampler2D colorMap,
	uniform sampler2D NormalMap,
	uniform float4 LightColor,
	uniform float4 AmbientColor )
{
	PixelOut OUT;
	
	// get the color from the diffuse texture
	float3 texColor = tex2D( colorMap, IN.texCoord0 );
	
	// get the color from the normal map and convert to normal
	float3 bumpNormal = (2* (tex2D(NormalMap, IN.texCoord0)-0.5));
	
	// unpack light vector to [-1,1]
	float3 lightVector = 2*(LightPosition - 0.5);

	// compute the angle to the light and clamp at zero
	float bump = max(dot(bumpNormal, lightVector),0);
	
	// compute final color (diffuse + ambient)
	float3 diffuse = texColor * bump * LightColor;
	float3 ambient = texColor * AmbientColor*0.5;
	OUT.col.rgb = diffuse + ambient;
	OUT.col.a = 1.0;
	
	return OUT;
}

//====================================================
// Techniques
//====================================================

technique diffuseBump
{
	pass p0
	{
		ZEnable = true;
		ZWriteEnable = true;
		//CullMode = CW;
		VertexShader = compile vs_2_0 DiffuseBumpVS();
		PixelShader = compile ps_2_0 DiffuseBumpPS(cmap, normalSampler, lightColor, ambiColor);
	}
}
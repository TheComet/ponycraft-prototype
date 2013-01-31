//==================================================================
// Heat Haze
//==================================================================
// Original Refraction Shader by EVOLVED. (www.evolved-software.com)
// Modified to support texture scrolling + mask by Sixty Squares
// Simplified and re-written by Green Gandalf 19 October 2010
//==================================================================

//--------------
// un-tweaks
//--------------
matrix mWVP : WorldViewProjection; 
matrix mW : World;   
matrix mVI : ViewInverse;

//--------------
// tweaks
//--------------
float4 colour = {0.95, 0.6, 1.0, 1.0};
float bumpiness = 0.3;
float bumpScale = 3.0;
float2 offset = {0.0, 0.0};

//--------------
// textures
//--------------
texture screenTexture <string Name = "";>;	
sampler2D screenSample = sampler_state
{ texture = <screenTexture>;
  addressU = clamp;
  addressV = clamp;
};
	  
texture maskTexture <string Name = "";>; 
sampler2D maskSample = sampler_state 
{ texture = <maskTexture>;
  addressU = clamp;
  addressV = clamp;
};

texture normalMap <string Name = "";>; 
sampler2D normalMapSample = sampler_state 
{ texture = <normalMap>;
  addressU = wrap;
  addressV = wrap;
};

//--------------
// structs 
//--------------
struct VSInput
{ float4 pos    : position; 
  float2 UV     : texcoord0;
  float3 normal : normal;
};

struct VSOutput
{ float4 pos  : position; 
  float2 UV0  : texcoord0; 
  float2 UV1  : texcoord1; 
  float4 proj : texcoord2;
};

struct PSOutput { float4 colour : color; };

//--------------
// vertex shader
//--------------
VSOutput VS(VSInput In, VSOutput Out)
{ Out.pos = mul(In.pos, mWVP); 
  Out.UV0  = In.UV;
  Out.UV1  = In.UV * bumpScale + offset;
  Out.proj = float4(Out.pos.x*0.5+0.5*Out.pos.w, 0.5*Out.pos.w-Out.pos.y*0.5, Out.pos.w, Out.pos.w);
  return Out;
}

//--------------
// pixel shader
//--------------
PSOutput PS(VSOutput In, PSOutput Out)
{ float2 distort = tex2D(normalMapSample, In.UV1).xy * 2 - 1;
  distort = distort * bumpiness;
  float2 UV = In.proj.xy/In.proj.z + distort * tex2D(maskSample, In.UV0).x;
  Out.colour = tex2D(screenSample, UV) * colour;
  return Out;
}

//--------------
// techniques   
//--------------
technique haze
{ pass p1
  {	VertexShader = compile vs_2_0 VS(); 
 	PixelShader  = compile ps_2_0 PS(); 	
  }
}

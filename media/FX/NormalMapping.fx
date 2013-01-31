//
// Green Gandalf's Bumpmapper v1.4
//
// Created 27 June 2006,    Modified 2 August 2009.
//
// Bumpmapping using a texture and normal map with a single directional light source
// plus ambient light and specular reflection.
// Uses full normalization in the pixel shader.
//
// Contains two techniques:
//   t0 - standard normal mapping suitable for simple objects such as cubes
//   t1 - improved normal mapping suitable for objects such as DBPro spheres
//        which might contain seams.
//
// Special thanks to Morcilla of MPL3D for some useful corrections.

matrix wvp : WorldViewProjection;
matrix mworld : World;
matrix winv: WorldInverse;
float4 eyePos : CameraPosition;

texture baseTexture < string ResourceName = ""; >;
texture nMapTexture < string ResourceName = ""; >;

sampler baseSample = sampler_state 
{ texture = <baseTexture>;
  mipFilter = linear;
  magFilter = linear;
  minFilter = linear;
};
sampler nMapSample = sampler_state 
{ texture = <nMapTexture>;
  mipFilter = linear;
  magFilter = linear;
  minFilter = linear;
};

float4 lightDir   = {0.1, -0.2, 0.1, 1.0};
float4 ambiColor  = {0.2, 0.2, 0.2, 1.0};
float4 lightColor = {1.0, 1.0, 1.0, 1.0};
float specLevel  = 0.0;
float specExpon=10.0;

struct VSInput
{ float4 pos          : position;
  float2 UV           : texcoord0;
  float3 tangent      : tangent;
  float3 binormal     : binormal;
  float3 normal       : normal;
};

struct VSOutput
{ float4 pos          : position;
  float2 UV           : texcoord0;
  float3 light        : texcoord1;
  float3 view         : texcoord2;
};

VSOutput GGBumpVShader0(VSInput In, VSOutput Out)
{ Out.pos = mul(In.pos, wvp);
  Out.UV = In.UV;
  // normalize everything just in case
  float3 n = normalize(In.normal);
  float3 t = normalize(In.tangent);
  float3 b = normalize(In.binormal);
  float3x3 TSM = {t, b, n};
  TSM = transpose(TSM);  
  float3 temp = -mul(lightDir.xyz, winv);  
  Out.light = mul(temp, TSM);  
  temp = (mul(eyePos, winv) - In.pos).xyz;
  Out.view = mul(temp, TSM);
  return Out;
}

VSOutput GGBumpVShader1(VSInput In, VSOutput Out)
{ Out.pos = mul(In.pos, wvp);
  Out.UV = In.UV;
  // adjust tangents and binormals - GG fix for seams on DBPro spheres
  float3 n = normalize(In.normal);
  float3 b = normalize(cross(n, In.tangent));
  float3 t = normalize(cross(b, n));
  float3x3 TSM = {t, b, n};
  TSM = transpose(TSM);  
  float3 temp = -mul(lightDir.xyz, winv);  
  Out.light = mul(temp, TSM);  
  temp = (mul(eyePos, winv) - In.pos).xyz;
  Out.view = mul(temp, TSM);
  return Out;
}

struct PSInput
{ float2 UV           : texcoord0;
  float3 light        : texcoord1;
  float3 view         : texcoord2;
};

struct PSOutput { float4 col : color; };

PSOutput GGBumpPShader(PSInput In, PSOutput Out)
{ float4 baseColour = tex2D(baseSample, In.UV);
  float3 normal     = 2 * tex2D(nMapSample, In.UV) - 1.0;
  float3 tempLightDir = normalize(In.light);
  float3 tempViewDir  = normalize(In.view);
  float diffuse       = saturate(dot(normal, tempLightDir));
  float3 reflect      = 2 * diffuse * normal - tempLightDir;
  float specular = diffuse * specLevel * pow(saturate(dot(reflect, tempViewDir)), specExpon);
  Out.col = baseColour * (ambiColor + diffuse * lightColor) + specular * lightColor;
  return Out;
}

technique t0
{ pass p0
  { VertexShader = compile vs_2_0 GGBumpVShader0();
    PixelShader = compile ps_2_0 GGBumpPShader();
  }
}

technique t1
{ pass p0
  { VertexShader = compile vs_2_0 GGBumpVShader1();
    PixelShader = compile ps_2_0 GGBumpPShader();
  }
}

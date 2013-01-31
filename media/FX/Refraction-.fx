//====================================================
// Texture Refraction
//====================================================
// By EVOLVED
// www.evolved-software.com
//====================================================

//--------------
// un-tweaks
//--------------
   matrix WorldVP:WorldViewProjection; 
   matrix World:World;   
   matrix ViewInv:ViewInverse;

//--------------
// tweaks
//--------------
   float3 Color={1.0f, 1.0f, 1.0f};
   float Bumpyness=0.25f;
   float RefractFactor=0.5f;
   float Alpha=1.0f;
   float4 FogColor={0.8f, 0.8f, 0.8f, 1.0f};
   float FogRange=1000.0f;

//--------------
// Textures
//--------------
   texture ScreenTX <string Name="";>;	
   sampler2D Screen=sampler_state
      {
	Texture = <ScreenTX>;
   	ADDRESSU = CLAMP;
   	ADDRESSV = CLAMP;
   	ADDRESSW = CLAMP;
      };
   texture BaseTX <string Name="";>;	
   sampler2D Base = sampler_state 
    {
 	texture = <BaseTX>;
    };
   texture NormalmapTX <string Name="";>; 
   sampler2D Normalmap=sampler_state 
      {
   	Texture = <NormalmapTX>;
      };

//--------------
// structs 
//--------------
   struct input
     {
 	float4 Pos:POSITION; 
 	float2 UV:TEXCOORD;
	float3 normal : NORMAL;
     };
   struct output
     {
 	float4 OPos:POSITION; 
 	float2 Tex:TEXCOORD0; 
        float4 Proj:TEXCOORD1;
	float Fog:FOG;
     };

//--------------
// vertex shader
//--------------
   output VS(input IN)
     {
 	output OUT;
	OUT.OPos=mul(IN.Pos,WorldVP); 
 	OUT.Tex=IN.UV;
        OUT.Proj=float4(OUT.OPos.x*0.5+0.5*OUT.OPos.w,0.5*OUT.OPos.w-OUT.OPos.y*0.5,OUT.OPos.w,OUT.OPos.w);
	float3 WPos=mul(IN.Pos,World);
	float3 ViewPos=ViewInv[3].xyz-WPos; 
	OUT.Fog=1-saturate(dot(ViewPos/FogRange,ViewPos/FogRange)); 
        return OUT;
     }

//--------------
// pixel shader
//--------------
   float4 PS(output IN) : COLOR 
     {
        float3 distort=tex2D(Normalmap,IN.Tex)*2-1;
        distort=normalize(distort)*Bumpyness;
	float3 Texture=tex2D(Base,IN.Tex);
        float2 nuv=IN.Proj.xy/IN.Proj.z+distort;
        float3 Refract=tex2D(Screen,nuv)*Color;
        return float4(lerp(Texture,Refract,RefractFactor),Alpha);
     }

//--------------
// techniques   
//--------------
    technique Refraction
      {
 	pass p1
      {		
 	VertexShader = compile vs_2_0 VS(); 
 	PixelShader  = compile ps_2_0 PS(); 	
	FOGCOLOR=(FogColor); 
	FOGENABLE=TRUE;		
      }
      }



//====================================================
// Unit Shader
//====================================================
// By TheComet
// FastBone shader
//====================================================

//--------------
// un-tweaks
//--------------

	matrix WorldVP:WorldViewProjection; 
	matrix World:World;   
	matrix ViewInv:ViewInverse;
	matrix boneMatrix[32]:BoneMatrixPalette;

//--------------
// tweaks
//--------------


//--------------
// Textures
//--------------

	texture BaseTX <string Name="";>;	
	sampler2D Base = sampler_state 
	{
 		texture = <BaseTX>;
	};

//--------------
// structs 
//--------------

	struct input
	{
		float4 Pos:POSITION; 
		float2 UV:TEXCOORD;
		float3 Normal:NORMAL;
		float4 Blendweight:TEXCOORD1;
		float4 Blendindices:TEXCOORD2;
	};
	struct output
	{
		float4 OPos:POSITION; 
		float2 Tex:TEXCOORD0; 
	};

//--------------
// vertex shader
//--------------

	output VS(input IN) 
	{
		output OUT;
		float3 netPosition = 0, netNormal = 0;
		for (int i = 0; i < 4; i++)
		{
			float index = IN.Blendindices[i];
			float3x4 model = float3x4(boneMatrix[index][0], boneMatrix[index][1], boneMatrix[index][2]);
			float3 vec3 = mul(model,IN.Pos);
			vec3 = vec3 + boneMatrix[index][3].xyz;
			float3x3 rotate = float3x3(model[0].xyz, model[1].xyz, model[2].xyz);
			float3 norm3 = mul(rotate, IN.Normal);
			netPosition += vec3.xyz * IN.Blendweight[i];
			netNormal += norm3.xyz * IN.Blendweight[i];
		}
		float4 TempPos = float4(netPosition, 1.0);
		float3 TempNormal = normalize(netNormal);
		OUT.OPos = mul(mul(TempPos,World),WorldVP);
		OUT.Tex = IN.UV;
		return OUT;
	}

//--------------
// pixel shader
//--------------

	float4 PS(output IN)  : COLOR
	{
		float2 NewUv=IN.Tex;
		float4 Texture=tex2D(Base,NewUv);
		return Texture;
	}

//--------------
// techniques   
//--------------

	technique Ambient
	{
		pass p1
		{		
			vertexShader = compile vs_2_0 VS(); 
			pixelShader  = compile ps_2_0 PS();
		}
	}
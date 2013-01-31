// wandelt eine Farbe in einen Normalenvektor um (aus einer Normal-Map)

float4x4 worldViewProjectionMatrix : WorldViewProjection;
float4x4 ViewInv : ViewInverse;
float4x4 World : World;

float4 LightPosition = {0.0f, 50.0f, 50.0f, 0.0f};

inline float3 decodeNormal(float4 n)
{
    return 2.0 * n.xyz - 1.0;
}

texture diffuseTexture
<
    string ResourceName = "";
    string ResourceType = "2D";
    string UIWidget = "Texture";
    string UIName = "Diffuse Texture";
>;

texture normalTexture
<
    string ResourceName = "";
    string ResourceType = "2D";
    string UIWidget = "Texture";
    string UIName = "Normal Texture";
>;

float4 materialAmbient
<
    string UIWidget = "Color";
    float4 UIMin = float4(0.0, 0.0, 0.0, 0.0);
    float4 UIMax = float4(1.0, 1.0, 1.0, 0.0);
    string UIName = "Material Ambient";
> = {0.5, 0.5, 0.5, 0.0};

float4 materialDiffuse
<
    string UIWidget = "Color";
    float4 UIMin = float4(0.0, 0.0, 0.0, 0.0);
    float4 UIMax = float4(1.0, 1.0, 1.0, 1.0);
    string UIName = "Material Diffuse";
> = {1.0, 1.0, 1.0, 1.0};

float4 materialSpecular
<
    string UIWidget = "Color";
    float4 UIMin = float4(0.0, 0.0, 0.0, 0.0);
    float4 UIMax = float4(1.0, 1.0, 1.0, 0.0);
    string UIName = "Material Specular";
> = {0.3, 0.3, 0.3, 0.0};

float materialShininess
<
    string UIWidget = "Slider";
    float UIMin = 1.0;
    float UIMax = 100.0;
    float UIStep = 0.1;
    string UIName = "Material Shininess";
> = 16.0;

float lightDiffuse
<
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UIMax = 1.0;
	float UIStep = 0.05;
	string UIName = "Light Diffuse";
> = 0.5;

float lightSpecular
<
	string UIWidget = "Slider";
	float UIMin = 0.0;
	float UIMax = 1.0;
	float UIStep = 0.05;
	string UIName = "Light Specular";
> = 0.5;

sampler diffuseTextureSampler = sampler_state 
{
    texture = <diffuseTexture>;
    addressU = WRAP;
    addressV = WRAP;
    mipFilter = LINEAR;
    minFilter = LINEAR;
    magFilter = LINEAR;
};

sampler normalTextureSampler = sampler_state 
{
    texture = <normalTexture>;
    addressU = WRAP;
    addressV = WRAP;
    mipFilter = LINEAR;
    minFilter = LINEAR;
    magFilter = LINEAR;
};

struct VertexInput
{
    float4 position : POSITION;
    float3 normal   : NORMAL;
    float3 tangent  : TANGENT;
    float2 texCoord : TEXCOORD0;
};

struct VertexOutput
{
    float4 position         : POSITION;
    float4 diffuse          : COLOR0;
    float4 specular         : COLOR1;
    float2 texCoordDiffuse  : TEXCOORD0;
    float2 texCoordBump     : TEXCOORD1;
    float3 lightVector      : TEXCOORD2;
    float3 halfVector       : TEXCOORD3;
};

VertexOutput vs(VertexInput IN)
{
    VertexOutput OUT;

    OUT.position = mul(IN.position, worldViewProjectionMatrix);
    OUT.diffuse = materialDiffuse * lightDiffuse;
    OUT.specular = materialSpecular * lightSpecular;
    OUT.texCoordDiffuse = IN.texCoord;
    OUT.texCoordBump = IN.texCoord;

	float3 WPos=mul(IN.position,World);
	float3 cameraPositionMS = ViewInv[3].xyz-WPos;
    float3x3 objToTangent = transpose(float3x3(IN.tangent, cross(IN.normal, IN.tangent), IN.normal));
    float3 l = mul(LightPosition - IN.position.xyz, objToTangent);
    float3 h = mul(cameraPositionMS - IN.position.xyz, objToTangent);
    OUT.lightVector = normalize(l);
    OUT.halfVector = normalize(normalize(h) + l);

    return OUT;
}

float4 ps(VertexOutput IN) : COLOR
{
    float3 bumpNormal = decodeNormal(tex2D(normalTextureSampler, IN.texCoordBump));
    float3 lightVector = normalize(IN.lightVector);
    float nDotL = saturate(dot(bumpNormal, lightVector));
    float4 diffuseTexture = tex2D(diffuseTextureSampler, IN.texCoordDiffuse);

    float3 halfVector = normalize(IN.halfVector);
    float nDotH = saturate(dot(bumpNormal, halfVector));
    float f = pow(nDotH, materialShininess);

    return nDotL * IN.diffuse * diffuseTexture + f * IN.specular;
}

technique tPS20
{
    pass p0
    {
        vertexShader = compile vs_2_0 vs();
        pixelShader = compile ps_2_0 ps();
    }
}
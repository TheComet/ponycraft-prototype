xof 0303txt 0032

// DirectX 8.0 file
// Creator: Ultimate Unwrap3D Pro v3.22
// Website: http://www.unwrap3d.com
// Time: Tue Sep 21 12:06:29 2010

// Start of Templates

template VertexDuplicationIndices {
 <b8d65549-d7c9-4995-89cf-53a9a8b031e3>
 DWORD nIndices;
 DWORD nOriginalVertices;
 array DWORD indices[nIndices];
}

template FVFData {
 <b6e70a0e-8ef9-4e83-94ad-ecc8b0c04897>
 DWORD dwFVF;
 DWORD nDWords;
 array DWORD data[nDWords];
}

template XSkinMeshHeader {
 <3CF169CE-FF7C-44ab-93C0-F78F62D172E2>
 WORD nMaxSkinWeightsPerVertex;
 WORD nMaxSkinWeightsPerFace;
 WORD nBones;
}

template SkinWeights {
 <6F0D123B-BAD2-4167-A0D0-80224F25FABB>
 STRING transformNodeName;
 DWORD nWeights;
 array DWORD vertexIndices[nWeights];
 array FLOAT weights[nWeights];
 Matrix4x4 matrixOffset;
}

template AnimTicksPerSecond {
 <9E415A43-7BA6-4a73-8743-B73D47E88476>
 DWORD AnimTicksPerSecond;
}

AnimTicksPerSecond {
 4800;
}

// Start of Frames

Frame Default_Layer {
   FrameTransformMatrix {
    1.000000, 0.000000, 0.000000, 0.000000,
    0.000000, 1.000000, 0.000000, 0.000000,
    0.000000, 0.000000, 1.000000, 0.000000,
    0.000000, 0.000000, 0.000000, 1.000000;;
   }

   Mesh Default_Layer {
    202;
    1.270935; 0.946021; 0.796092;,
    1.118873; 0.918694; 0.428257;,
    -0.007003; 0.873132; 0.796092;,
    -0.007003; 0.873132; 0.428257;,
    -1.052947; 0.873132; 0.428257;,
    1.223065; 0.000000; 0.341335;,
    -1.052947; 0.000000; 0.428257;,
    -0.007003; 0.873132; 0.428257;,
    1.359881; 0.329415; 0.428257;,
    1.224906; 0.196908; 0.428257;,
    1.237430; 0.521199; 0.796092;,
    -0.007003; 0.873132; 0.796092;,
    1.359807; 0.329415; 0.796092;,
    1.004654; 0.071815; -0.164477;,
    1.004517; 0.059940; 0.114752;,
    1.004953; 0.000000; -0.795850;,
    1.004332; 0.000000; 0.504734;,
    0.781611; 0.869258; -0.496742;,
    0.781611; 0.000000; -0.496742;,
    0.781131; 0.000000; 0.504629;,
    0.781131; 0.869258; 0.504631;,
    -1.280476; 0.837024; 0.796092;,
    -1.359881; 0.000000; 0.796092;,
    1.293146; 0.000000; 0.796092;,
    -1.359881; 0.802545; 0.759123;,
    -1.359881; 0.816839; 0.001998;,
    -1.359881; 0.000000; 0.796092;,
    -0.505834; 0.654513; -0.264524;,
    -0.257675; 1.061094; 0.070898;,
    -0.177373; 0.638978; -0.110331;,
    -0.906874; 0.267602; -0.082552;,
    -0.863292; 0.003738; -0.184748;,
    -0.293674; 0.003738; 0.096752;,
    -0.461716; 1.021183; 0.490806;,
    1.004615; 0.712992; -0.082948;,
    1.004332; 0.869258; 0.504735;,
    1.004405; 0.505803; 0.349805;,
    -1.359881; 0.412120; -0.069724;,
    -1.359881; 0.000000; -0.069724;,
    -0.625972; 0.002806; -0.664964;,
    -0.702235; 0.452873; -0.444180;,
    -0.056353; 0.002806; -0.383466;,
    1.004721; 0.642583; -0.306385;,
    1.004953; 0.869258; -0.795850;,
    -1.359881; 0.947327; -0.069724;,
    -1.359881; 0.947327; 0.796092;,
    -1.052947; 0.947327; 0.796092;,
    -1.052947; 0.947327; -0.069724;,
    -1.121129; 0.721672; 0.174174;,
    -1.052947; 0.873132; 0.428257;,
    -1.052947; 0.444659; -0.034574;,
    -1.031341; 1.021183; 0.209308;,
    -0.857329; 1.218994; -0.142808;,
    -0.415782; 1.218994; 0.075401;,
    -0.774342; 0.782741; -0.330109;,
    0.832425; 0.382742; -0.208392;,
    0.829391; 0.446064; 0.085427;,
    0.925061; 0.174299; -0.132050;,
    0.916524; 0.183999; 0.089363;,
    1.004391; 0.223600; 0.380850;,
    1.359881; 0.329415; 0.428257;,
    1.359807; 0.329415; 0.796092;,
    1.224906; 0.196908; 0.428257;,
    0.497237; 0.869259; -0.796092;,
    0.906880; 0.262527; -0.795897;,
    0.497237; 0.000000; -0.796092;,
    0.883453; 0.539608; -0.795908;,
    1.004953; 0.869258; -0.795850;,
    0.781611; 0.869258; -0.496742;,
    0.781131; 0.869258; 0.504631;,
    1.004332; 0.869258; 0.504735;,
    1.004953; 0.869258; -0.795850;,
    1.321916; 0.666891; 0.499576;,
    1.321898; 0.653947; 0.636106;,
    1.359830; 0.504003; 0.668022;,
    -1.271315; 0.703883; 0.142366;,
    -1.359881; 0.598891; 0.077804;,
    0.867180; 0.646521; -0.059591;,
    0.872466; 0.623285; -0.256247;,
    1.004913; 0.581469; -0.709829;,
    1.004717; 0.321545; -0.307395;,
    1.004889; 0.292617; -0.663728;,
    1.004916; 0.202870; -0.721942;,
    -0.257675; 1.061094; 0.070898;,
    -0.360275; 1.136507; 0.285523;,
    -0.177373; 0.638978; -0.110331;,
    -0.360275; 1.136507; 0.285523;,
    -1.031341; 1.021183; 0.209308;,
    -0.461716; 1.021183; 0.490806;,
    -0.415782; 1.218994; 0.075401;,
    -0.293674; 0.003738; 0.096752;,
    -0.056353; 0.002806; -0.383466;,
    -0.461716; 1.021183; 0.490806;,
    -0.860690; 0.642491; -0.159063;,
    -0.792389; 0.474348; -0.131635;,
    -0.906874; 0.267602; -0.082552;,
    -1.052947; 0.947327; -0.069724;,
    -1.052947; 0.947327; 0.796092;,
    -1.052947; 0.873132; 0.428257;,
    -1.052947; 0.822052; 0.038100;,
    -1.052947; 0.000000; -0.069724;,
    -1.052947; 0.444659; -0.034574;,
    -1.052947; 0.000000; 0.428257;,
    -0.906874; 0.267602; -0.082552;,
    -0.702235; 0.452873; -0.444180;,
    -0.625972; 0.002806; -0.664964;,
    0.781611; 0.869258; -0.496742;,
    0.497101; 0.000000; -0.496878;,
    0.781611; 0.000000; -0.496742;,
    0.497100; 0.869259; -0.496878;,
    1.099585; 0.672033; 0.428257;,
    1.234805; 0.517390; 0.428257;,
    1.317387; 0.849277; 0.493949;,
    1.317375; 0.839483; 0.586200;,
    -1.256807; 0.797154; 0.067929;,
    -1.103441; 0.852794; 0.173119;,
    -1.052947; 0.947327; -0.069724;,
    -1.052947; 0.822052; 0.038100;,
    -1.222416; 0.812890; -0.053934;,
    -1.052947; 0.873132; 0.796092;,
    1.253739; 0.079733; 0.796092;,
    1.183658; 0.079733; 0.395940;,
    1.253739; 0.079733; 0.796092;,
    -0.702235; 0.452873; -0.444180;,
    -1.359881; 0.000000; -0.069724;,
    -1.359881; 0.412120; -0.069724;,
    -1.052947; 0.000000; -0.069724;,
    -1.052947; 0.444659; -0.034574;,
    1.004615; 0.712992; -0.082948;,
    1.004405; 0.505803; 0.349805;,
    0.921606; 0.279258; 0.307214;,
    1.183658; 0.079733; 0.395940;,
    -1.052947; 0.873132; 0.428257;,
    -1.052947; 0.873132; 0.796092;,
    -1.222416; 0.812890; -0.053934;,
    -1.052947; 0.822052; 0.038100;,
    -0.857329; 1.218994; -0.142808;,
    -1.031341; 1.021183; 0.209308;,
    -0.857329; 1.218994; -0.142808;,
    -0.774342; 0.782741; -0.330109;,
    -0.860690; 0.642491; -0.159063;,
    0.497237; 0.869259; -0.796092;,
    0.497100; 0.869259; -0.496878;,
    0.497237; 0.869259; -0.796092;,
    0.497237; 0.000000; -0.796092;,
    0.497101; 0.000000; -0.496878;,
    0.497100; 0.869259; -0.496878;,
    1.004721; 0.642583; -0.306385;,
    1.004717; 0.321545; -0.307395;,
    1.317375; 0.839483; 0.586200;,
    1.270935; 0.946021; 0.796092;,
    1.321898; 0.653947; 0.636106;,
    1.270935; 0.946021; 0.796092;,
    -0.863292; 0.003738; -0.184748;,
    1.118873; 0.918694; 0.428257;,
    1.217621; 0.856252; 0.502661;,
    1.099585; 0.672033; 0.428257;,
    1.229109; 0.673652; 0.500738;,
    1.217621; 0.856252; 0.502661;,
    -1.359881; 0.816839; 0.001998;,
    -1.359881; 0.947327; -0.069724;,
    -1.359881; 0.947327; -0.069724;,
    -1.359881; 0.598891; 0.077804;,
    -1.359881; 0.412120; -0.069724;,
    1.234805; 0.517390; 0.428257;,
    1.359881; 0.329415; 0.428257;,
    1.293146; 0.000000; 0.796092;,
    1.223065; 0.000000; 0.341335;,
    1.237430; 0.521199; 0.796092;,
    1.359830; 0.504003; 0.668022;,
    -0.637411; 0.593554; -0.232046;,
    -0.505834; 0.654513; -0.264524;,
    -0.774342; 0.782741; -0.330109;,
    0.883453; 0.539608; -0.795908;,
    1.004913; 0.581469; -0.709829;,
    0.962335; 0.281263; -0.754703;,
    0.906880; 0.262527; -0.795897;,
    -0.367099; 1.174300; 0.138691;,
    -1.359881; 0.802545; 0.759123;,
    -1.359881; 0.947327; 0.796092;,
    1.004654; 0.071815; -0.164477;,
    1.317387; 0.849277; 0.493949;,
    1.317375; 0.839483; 0.586200;,
    1.317387; 0.849277; 0.493949;,
    1.321916; 0.666891; 0.499576;,
    -1.052947; 0.873132; 0.796092;,
    -1.052947; 0.947327; 0.796092;,
    -1.359881; 0.947327; 0.796092;,
    1.004953; 0.869258; -0.795850;,
    1.118873; 0.918694; 0.428257;,
    -0.367099; 1.174300; 0.138691;,
    -0.367099; 1.174300; 0.138691;,
    1.004889; 0.292617; -0.663728;,
    1.004916; 0.202870; -0.721942;,
    1.359807; 0.329415; 0.796092;,
    1.359807; 0.329415; 0.796092;,
    1.359881; 0.329415; 0.428257;,
    -1.359881; 0.816839; 0.001998;,
    1.004391; 0.223600; 0.380850;,
    1.004517; 0.059940; 0.114752;,
    1.004953; 0.000000; -0.795850;,
    1.004953; 0.000000; -0.795850;;
    164;
    3;0, 1, 2;,
    3;1, 3, 2;,
    3;4, 5, 6;,
    3;7, 8, 9;,
    3;10, 11, 12;,
    3;13, 14, 15;,
    3;15, 14, 16;,
    3;17, 18, 19;,
    3;20, 17, 19;,
    3;21, 22, 23;,
    3;24, 25, 26;,
    3;27, 28, 29;,
    3;30, 31, 32;,
    3;33, 30, 32;,
    3;34, 35, 36;,
    3;37, 38, 26;,
    3;39, 40, 41;,
    3;34, 35, 42;,
    3;43, 35, 42;,
    3;44, 45, 46;,
    3;47, 44, 46;,
    3;48, 49, 50;,
    3;33, 51, 30;,
    3;52, 53, 54;,
    3;55, 56, 57;,
    3;56, 58, 57;,
    3;59, 35, 16;,
    3;36, 35, 59;,
    3;60, 61, 62;,
    3;63, 64, 65;,
    3;63, 66, 64;,
    3;63, 67, 66;,
    3;68, 69, 70;,
    3;71, 68, 70;,
    3;72, 73, 74;,
    3;75, 48, 50;,
    3;25, 76, 26;,
    3;77, 56, 55;,
    3;78, 77, 55;,
    3;43, 42, 79;,
    3;79, 42, 80;,
    3;79, 80, 81;,
    3;81, 80, 82;,
    3;83, 84, 85;,
    3;86, 87, 88;,
    3;86, 89, 87;,
    3;85, 90, 91;,
    3;85, 92, 90;,
    3;93, 94, 95;,
    3;53, 28, 54;,
    3;54, 28, 27;,
    3;96, 97, 98;,
    3;96, 98, 99;,
    3;100, 101, 102;,
    3;101, 98, 102;,
    3;103, 104, 105;,
    3;106, 107, 108;,
    3;106, 109, 107;,
    3;7, 110, 111;,
    3;112, 113, 72;,
    3;72, 113, 73;,
    3;114, 115, 48;,
    3;114, 48, 75;,
    3;116, 117, 118;,
    3;119, 21, 23;,
    3;12, 11, 120;,
    3;121, 62, 122;,
    3;62, 61, 122;,
    3;94, 123, 95;,
    3;40, 27, 41;,
    3;27, 29, 41;,
    3;124, 125, 126;,
    3;125, 127, 126;,
    3;77, 128, 129;,
    3;56, 130, 58;,
    3;56, 129, 130;,
    3;4, 7, 5;,
    3;7, 131, 5;,
    3;132, 133, 2;,
    3;3, 132, 2;,
    3;134, 135, 114;,
    3;135, 115, 114;,
    3;49, 115, 135;,
    3;89, 136, 87;,
    3;137, 138, 139;,
    3;137, 140, 103;,
    3;137, 139, 140;,
    3;141, 142, 68;,
    3;71, 141, 68;,
    3;143, 144, 145;,
    3;146, 143, 145;,
    3;147, 78, 148;,
    3;78, 55, 148;,
    3;82, 80, 15;,
    3;84, 92, 85;,
    3;149, 150, 151;,
    3;152, 11, 10;,
    3;153, 103, 105;,
    3;154, 155, 156;,
    3;155, 157, 156;,
    3;1, 0, 158;,
    3;159, 160, 118;,
    3;160, 116, 118;,
    3;161, 25, 24;,
    3;162, 50, 163;,
    3;162, 75, 50;,
    3;76, 37, 26;,
    3;156, 157, 164;,
    3;72, 74, 165;,
    3;121, 122, 166;,
    3;167, 121, 166;,
    3;14, 59, 16;,
    3;77, 129, 56;,
    3;151, 150, 168;,
    3;151, 168, 169;,
    3;170, 171, 123;,
    3;172, 171, 170;,
    3;173, 174, 175;,
    3;173, 175, 176;,
    3;147, 128, 78;,
    3;128, 77, 78;,
    3;177, 84, 83;,
    3;21, 178, 22;,
    3;119, 179, 21;,
    3;115, 49, 48;,
    3;93, 170, 94;,
    3;93, 172, 170;,
    3;148, 57, 180;,
    3;148, 55, 57;,
    3;80, 13, 15;,
    3;181, 158, 182;,
    3;158, 0, 182;,
    3;157, 183, 184;,
    3;155, 183, 157;,
    3;98, 97, 185;,
    3;186, 179, 119;,
    3;114, 75, 162;,
    3;187, 161, 24;,
    3;21, 179, 178;,
    3;188, 174, 173;,
    3;7, 189, 110;,
    3;190, 89, 86;,
    3;53, 191, 28;,
    3;174, 192, 175;,
    3;176, 175, 193;,
    3;94, 170, 123;,
    3;169, 168, 194;,
    3;165, 74, 195;,
    3;120, 11, 23;,
    3;11, 119, 23;,
    3;164, 184, 196;,
    3;7, 111, 8;,
    3;197, 114, 162;,
    3;197, 134, 114;,
    3;157, 184, 164;,
    3;130, 129, 198;,
    3;58, 130, 199;,
    3;130, 198, 199;,
    3;176, 193, 200;,
    3;65, 64, 201;,
    3;7, 9, 131;,
    3;175, 192, 193;,
    3;57, 58, 199;,
    3;180, 57, 199;;

   MeshTextureCoords {
    202;
    0.349291; 0.505420;,
    0.360686; 0.530137;,
    0.431155; 0.505385;,
    0.431155; 0.528758;,
    0.785292; 0.440336;,
    1.020829; 0.530694;,
    0.785292; 0.530694;,
    0.893533; 0.440336;,
    1.034987; 0.496604;,
    1.021019; 0.510316;,
    0.973315; 0.481144;,
    0.874325; 0.452920;,
    0.983050; 0.496458;,
    0.889357; 0.509834;,
    0.865248; 0.510859;,
    0.943870; 0.516034;,
    0.831577; 0.516034;,
    0.202451; 0.440982;,
    0.202451; 0.516034;,
    0.115992; 0.516034;,
    0.115992; 0.440982;,
    0.773024; 0.455647;,
    0.766708; 0.522407;,
    0.977747; 0.522727;,
    0.655542; 0.459659;,
    0.589243; 0.458565;,
    0.655542; 0.534960;,
    0.724683; 0.497935;,
    0.690615; 0.456897;,
    0.691391; 0.499511;,
    0.824524; 0.515411;,
    0.825102; 0.541646;,
    0.766791; 0.541660;,
    0.764566; 0.440498;,
    0.882318; 0.454474;,
    0.831577; 0.440982;,
    0.844954; 0.472363;,
    0.589243; 0.503402;,
    0.589243; 0.534960;,
    0.750870; 0.563721;,
    0.748151; 0.517642;,
    0.692560; 0.563736;,
    0.901610; 0.460553;,
    0.943870; 0.440982;,
    0.171119; 0.563531;,
    0.171119; 0.478017;,
    0.135715; 0.478017;,
    0.135715; 0.563531;,
    0.116956; 0.743307;,
    0.139296; 0.726663;,
    0.109526; 0.774356;,
    0.822876; 0.440484;,
    0.748634; 0.440942;,
    0.703434; 0.440953;,
    0.749437; 0.484984;,
    0.209204; 0.767162;,
    0.188729; 0.759904;,
    0.206110; 0.783247;,
    0.187126; 0.780005;,
    0.842273; 0.496728;,
    0.147747; 0.861877;,
    0.117898; 0.862912;,
    0.149580; 0.874578;,
    0.331099; 0.440220;,
    0.365495; 0.491164;,
    0.331099; 0.513207;,
    0.363528; 0.467899;,
    0.373729; 0.440220;,
    0.548452; 0.496039;,
    0.548452; 0.576153;,
    0.566309; 0.576153;,
    0.566309; 0.472101;,
    0.317258; 0.509072;,
    0.329849; 0.510265;,
    0.332793; 0.524094;,
    0.101167; 0.744654;,
    0.600540; 0.489100;,
    0.198094; 0.744725;,
    0.214421; 0.749825;,
    0.936443; 0.465830;,
    0.901697; 0.488272;,
    0.932463; 0.490769;,
    0.937489; 0.498518;,
    0.244296; 0.455282;,
    0.259950; 0.441826;,
    0.242917; 0.493833;,
    0.415522; 0.513124;,
    0.466947; 0.492373;,
    0.415521; 0.492373;,
    0.427084; 0.527966;,
    0.281571; 0.534490;,
    0.240839; 0.551933;,
    0.281114; 0.443175;,
    0.123391; 0.830911;,
    0.132275; 0.818817;,
    0.122338; 0.799466;,
    0.496817; 0.440643;,
    0.412847; 0.440643;,
    0.448521; 0.447220;,
    0.486360; 0.451747;,
    0.496816; 0.524612;,
    0.493408; 0.485199;,
    0.448521; 0.524612;,
    0.765454; 0.510885;,
    0.727862; 0.510214;,
    0.724840; 0.552010;,
    0.240501; 0.441040;,
    0.216940; 0.508297;,
    0.240501; 0.508302;,
    0.216940; 0.441034;,
    1.008050; 0.461147;,
    1.022044; 0.477151;,
    0.316739; 0.492251;,
    0.325247; 0.493155;,
    0.098211; 0.734483;,
    0.118919; 0.728909;,
    0.356279; 0.440453;,
    0.356279; 0.456659;,
    0.387819; 0.456875;,
    0.791123; 0.452794;,
    0.974613; 0.516362;,
    0.150173; 0.884658;,
    0.119399; 0.884658;,
    0.166579; 0.818473;,
    0.320547; 0.659548;,
    0.320547; 0.582731;,
    0.366035; 0.659548;,
    0.366035; 0.576665;,
    0.202272; 0.739268;,
    0.165743; 0.750902;,
    0.168515; 0.769900;,
    1.016751; 0.522442;,
    0.498040; 0.528792;,
    0.498040; 0.505348;,
    0.094484; 0.713036;,
    0.115717; 0.712672;,
    0.466947; 0.527966;,
    0.765116; 0.440938;,
    0.728814; 0.440938;,
    0.727388; 0.480780;,
    0.746517; 0.485240;,
    0.525690; 0.472101;,
    0.525690; 0.496039;,
    0.522261; 0.439936;,
    0.522261; 0.514988;,
    0.496427; 0.514988;,
    0.496427; 0.439936;,
    0.221397; 0.747424;,
    0.221960; 0.773070;,
    0.118400; 0.810200;,
    0.143150; 0.802543;,
    0.122025; 0.826395;,
    0.975980; 0.447260;,
    0.765572; 0.534567;,
    0.094785; 0.801115;,
    0.105742; 0.807560;,
    0.091008; 0.821981;,
    0.103498; 0.823134;,
    0.352627; 0.526266;,
    0.409749; 0.456782;,
    0.409749; 0.440453;,
    0.577769; 0.440617;,
    0.067218; 0.754914;,
    0.056301; 0.775597;,
    0.093092; 0.835879;,
    0.310681; 0.540195;,
    0.118913; 0.890522;,
    0.149687; 0.890522;,
    0.136637; 0.838478;,
    0.124997; 0.839606;,
    0.152539; 0.831849;,
    0.166580; 0.839742;,
    0.141936; 0.843952;,
    0.219301; 0.838097;,
    0.234223; 0.842138;,
    0.227837; 0.813152;,
    0.220875; 0.811344;,
    0.244812; 0.440861;,
    0.766479; 0.458445;,
    0.766708; 0.446838;,
    0.210166; 0.791388;,
    0.346038; 0.527043;,
    0.345342; 0.521072;,
    0.107638; 0.808637;,
    0.106078; 0.824215;,
    0.412847; 0.447219;,
    0.791123; 0.446875;,
    0.655542; 0.440617;,
    0.227461; 0.869923;,
    1.010046; 0.440336;,
    0.415522; 0.527966;,
    0.690324; 0.440956;,
    0.237848; 0.814250;,
    0.233271; 0.805583;,
    0.137852; 0.855464;,
    0.344604; 0.540195;,
    0.094438; 0.852555;,
    0.058110; 0.710959;,
    0.163520; 0.773083;,
    0.186415; 0.789169;,
    0.227461; 0.785994;,
    0.373729; 0.513207;;
   }

   MeshMaterialList {
    1;
    164;
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0;

    Material ruins_DF {
     0.588000; 0.588000; 0.588000; 1.000000;;
     128.000000;
     0.000000; 0.000000; 0.000000;;
     0.000000; 0.000000; 0.000000;;

     TextureFilename {
      "ruins_DF.tga";
     }
    }

   }
  }
}

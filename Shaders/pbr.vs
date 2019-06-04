#version 450 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec2 aTexCoords;
layout (location = 3) in vec2 aOffset;

// Uniform ª∫≥Â∂‘œÛ
layout(std140, binding = 0) uniform Matrices
{
	mat4 projection;
	mat4 view;
};

out vec2 TexCoords;
out vec3 WorldPos;
out vec3 Normal;
uniform mat4 model;

void main()
{
    TexCoords = aTexCoords+aOffset/8.0f;
    WorldPos = vec3(model * vec4(aPos, 1.0));
    Normal = mat3(model) * aNormal;   


    gl_Position =  projection * view * vec4(WorldPos.x + aOffset.x, WorldPos.y, WorldPos.z + aOffset.y,1.0);
}
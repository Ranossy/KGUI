------------------------------------------------
-- �ļ���    :  ����_�Ӿ���BUFF.lua
-- ������    :  CBG
-- ����ʱ��  :  2009-07-10
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  ����
-- �书��·  :  
-- ��������  :  ����
-- ����Ч��  :  �����ű���������Ӿ���BUFF��
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillRecipeData =
{	

};


--�����书���ܼ��������ֵ
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)

    local bRetCode     	= false;
    local nRecipeLevel	= SkillRecipeLevel;
	
   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,			-- ��������ģʽ
   		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- ħ������
   		"Map/���/skill/����_������.lua",					-- ����ֵ1
   		0															-- ����ֵ2
   		);
	
    return true;
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
------------------------------------------------
-- �ļ���    :  ����_�����.lua
-- ������    :  zhanghao
-- ����ʱ��  :  2011-04-10
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  ����
-- �书��·  :  
-- ��������  :  �������
-- ����Ч��  :  
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillRecipeData =
{
		{nBuffID = 2759},
		{nBuffID = 2760},
		{nBuffID = 2761},
};


--�����书���ܼ��������ֵ
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)

    local bRetCode     	= false;
    local nRecipeLevel	= SkillRecipeLevel;
    local dwSkillLevel	= skill.dwLevel;

--[[	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CALL_BUFF,
		tSkillRecipeData[nRecipeLevel].nBuffID,
		dwSkillLevel
	);--]]

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.CALL_BUFF,
		855,
		nRecipeLevel
	);
	
	skill.BindBuff(2,tSkillRecipeData[nRecipeLevel].nBuffID,dwSkillLevel)
    return
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
    return nPreResult;
end


function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
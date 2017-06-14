---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����/����_˫�_�������Ч��.lua
-- ����ʱ��:	2013/5/11 12:22:50
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ����_˫�_�������Ч��.lua
-- ������    :  zhanghao
-- ����ʱ��  :  2011-04-16
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  ����
-- �书��·  :  
-- ��������  :  ��������
-- ����Ч��  :  
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillRecipeData = 
{
	{nTherapy = 40 * 0.95, nTherapyRand = 40 * 0.1, nTherapyPowerPercent = 51 * 2}, 
	{nTherapy = 64 * 0.95, nTherapyRand = 64 * 0.1, nTherapyPowerPercent = 102 * 2}, 
	{nTherapy = 86 * 0.95, nTherapyRand = 86 * 0.1, nTherapyPowerPercent = 153 * 2}, 
	{nTherapy = 109 * 0.95, nTherapyRand = 109 * 0.1, nTherapyPowerPercent = 108 * 2},
	{nTherapy = 132 * 0.95, nTherapyRand = 132 * 0.1, nTherapyPowerPercent = 129 * 2},
	{nTherapy = 156 * 0.95, nTherapyRand = 156 * 0.1, nTherapyPowerPercent = 149 * 2},
	{nTherapy = 178 * 0.95, nTherapyRand = 178 * 0.1, nTherapyPowerPercent = 170 * 2},
};


--�����书���ܼ��������ֵ
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)

	local bRetCode = false;
	local nRecipeLevel = SkillRecipeLevel;
	local dwSkillLevel = skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		6249,
		3
	);
    
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
	--ATTRIBUTE_TYPE.SKILL_THERAPY,						-- ���ƻ���ֵ
	--tSkillRecipeData[dwSkillLevel].nTherapy, 
	--0
	--);
		
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
	--ATTRIBUTE_TYPE.SKILL_THERAPY_RAND,					-- ���Ƹ���ֵ
	--tSkillRecipeData[dwSkillLevel].nTherapyRand, 
	--0
	--);
    
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
	--ATTRIBUTE_TYPE.CALL_THERAPY,						-- Call����
	--0, 
	--0
	--);
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
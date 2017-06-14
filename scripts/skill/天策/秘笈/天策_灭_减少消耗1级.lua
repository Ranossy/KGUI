------------------------------------------------
-- �ļ���    :  ����-���_��_��������1��.lua
-- ������    :  	
-- ����ʱ��  :  2009-01-17
-- ��;(ģ��):  �书����
-- �书����  :  ͨ��
-- �书����  :  ����
-- �书��·  :  
-- ��������  :  
-- ����Ч��  :  ��,��������1��
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillRecipeData =
{	
	{nCostMana = 0, nDamage = 198*0.8, nDamageRand = 198*0.4, nCostLife = -149*0.05},		-- Level 1	42
	{nCostMana = 0, nDamage = 230*0.8, nDamageRand = 230*0.4, nCostLife = -172*0.05},		-- Level 2  48
	{nCostMana = 0, nDamage = 261*0.8, nDamageRand = 261*0.4, nCostLife = -196*0.05},		-- Level 3  54
	{nCostMana = 0, nDamage = 293*0.8, nDamageRand = 293*0.4, nCostLife = -219*0.05},		-- Level 4  60
	{nCostMana = 0, nDamage = 324*0.8, nDamageRand = 324*0.4, nCostLife = -243*0.05},		-- Level 5  66
};


--�����书���ܼ��������ֵ
function GetSkillRecipeData(skill, SkillRecipeID, SkillRecipeLevel)

	local nRecipeLevel	= SkillRecipeLevel;
	local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel;
	local nSkillID	= skill.dwSkillID
--	if nSkillID == 716 or nSkillID == 717 then
--		skill.AddAttribute(
--			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
--			ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
--			tSkillData[dwSkillLevel].nCostLife, 
--			0
--		);
--	end
	if nSkillID == 716 or nSkillID == 717 then
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.GLOBAL_RESIST_PERCENT,
		51, 
		0
	);
	end


    return true;
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
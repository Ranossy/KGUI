------------------------------------------------
-- �ļ���    :  ����ϵ_���ٺ󷭼��ܵ�CD.lua
-- ������    :  zhangqi	
-- ����ʱ��  :  2009-6-6
-- ��;(ģ��):  �书����
-- �书����  :  
-- �书����  : 
-- �书��·  :  
-- ��������  :  
-- ����Ч��  :  ����ϵ_���ٺ󷭼��ܵ�CD
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamage = -7, nDamageRand = 0, nCostMana = 0},		--level 1
	{nDamage = -14, nDamageRand = 0, nCostMana = 0},		--level 2
	{nDamage = -21, nDamageRand = 0, nCostMana = 0},		--level 3
	{nDamage = -28, nDamageRand = 0, nCostMana = 0},		--level 4
	{nDamage = -35, nDamageRand = 0, nCostMana = 0},		--level 5	

};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
    	
   	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.ADD_SPRINT_POWER_COST_ON_WALL,
		tSkillData[dwSkillLevel].nDamage,
		0
	);
	
    return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
    return nPreResult;
end


function OnSkillLevelUp(skill, player)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
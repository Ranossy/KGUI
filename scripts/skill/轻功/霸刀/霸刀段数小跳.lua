---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�Ṧ/�Ե�/�Ե�����С��.lua
-- ����ʱ��:	2016/9/21 16:11:53
-- �����û�:	zhangyan3
-- �ű�˵��:
----------------------------------------------------------------------<
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 1
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 2
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 3
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 4
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 5
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 6
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 7
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 8
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 9
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 10
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/�Ṧ/�Ե�/�Ե�����С��.lua",
		0
	);

	skill.nMaxRadius = 4 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	--if not player.bSprintFlag then--�Ƕ���ʹ�ô˼���
		--nPreResult = false
	--end
	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)

end

--��������ʱִ�еĺ���,����skillΪ������skill
function OnSkillForgotten(skill, player)

end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)

	local player = GetPlayer(dwCharacterID)
	-------------------------------------------------
	--��飬�жϵ����
--	player.Talk(1000000000)
--	player.Talk(16838)

	--����ʱ����
	local buff = player.GetBuff(10555, 1)
	if buff then
		for i = 1, buff.nStackNum do
			player.DelBuff(10555, 1)
		end
	end
	
	local buff1 = player.GetBuff(11338, 1)
	local buff3 = player.GetBuff(11340, 1)
	if buff1 or buff3 then
	
		player.DelBuff(11338, 1)
		player.DelBuff(11340, 1)
		
		player.CastSkill(16833, 1)
		return
	end
	
	local buff2 = player.GetBuff(11339, 1)
	
	if buff2 then
		player.DelBuff(11339, 1)
		
		player.CastSkill(16832, 1)	
		return
	end
	-------------------------------------------------
	--ִ���Ӽ��ܴ���
	player.CastSkill(16838, 1)--�Ե�С��ִ���Ӽ���
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
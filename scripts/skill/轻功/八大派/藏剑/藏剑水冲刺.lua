---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�Ṧ/�˴���/�ؽ�/�ؽ�ˮ���.lua
-- ����ʱ��:	2016/5/17 20:42:26
-- �����û�:	zhangyan-pc
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
		"skill/�Ṧ/�˴���/�ؽ�/�ؽ�ˮ���.lua",
		0
	);

	skill.nMaxRadius = 4 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	if not player.bSprintFlag then
		nPreResult = false
	end
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
	------------------------------------------------
	local buff = player.GetBuff(10191, 1)--CD
	if buff then
		return
	end
	player.AddBuff(0, 99, 10191, 1, 3)
	------------------------------------------------
	------------------------------------------------
	--����ʱ����
	local buff = player.GetBuff(10555, 1)
	if buff then
		for i = 1, buff.nStackNum do
			player.DelBuff(10555, 1)
		end
	end
	--���ʱ�����ж�
	player.AddBuff(0, 99, 10555, 1)
	-------------------------------------------------
	---------
	local nNumValue = 50 * 100--һ��������
	---------
	--ִ���Ӽ��ܴ���
	local nSkillid = 15923--�ؽ�ˮ���ִ���Ӽ���
	local nSkilllv = 1		
	----------
	local nNumPoint = player.nSprintPower
	if nNumPoint ~= 0 then
		if nNumPoint > nNumValue then
			if not (player.nDisableSprintPowerCost > 0) then
				player.SetSprintPower(0, nNumPoint - nNumValue)--�ۼ�����ֵ 0������,1������
			end
			player.CastSkill(nSkillid, nSkilllv)
		else
			if not (player.nDisableSprintPowerCost > 0) then
				player.SetSprintPower(0, 0)
			end	
			player.CastSkill(nSkillid, nSkilllv)
		end
	end	
	----------
	-------------------------------------------------
	--ִ���Ӽ��ܴ���
	--player.CastSkill(15923, 1)--�ؽ�ˮ���ִ���Ӽ���
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/������̬/��ʿ_�л�_�Ӽ���_�������.lua
-- ����ʱ��:	2016/7/1 12:06:06
-- �����û�:	wangwei2
-- �ű�˵��:	15275
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/Map/������̬/��ʿ/include/��ʿ_Data.lua")
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
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/Quest/������̬/��ʿ_�л�_�Ӽ���_�������.lua",
		0
	);

	----------------- �����Ƿ����������ʩ�� -------------------------------------------------
	skill.bIgnorePrepareState = true	--�����Ƿ����������ʩ�ţ�������ͨ����������������true

	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 10 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 6 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	--skill.nHeight = 6 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	skill.nAngleRange	= 256;					-- ������Χ�����νǶȷ�Χ
	skill.nAreaRadius	= 10 * LENGTH_BASE;		-- �������ð뾶
	skill.nTargetCountLimit = 30;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)
end

--��������ʱִ�еĺ���,����skillΪ������skill
function OnSkillForgotten(skill, player)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	--print("�ٻ�Ұ��----------", dwSkillSrcID)
	local fazhen = GetNpc(dwSkillSrcID)
	if not fazhen then
		return
	end
	local dwID = fazhen.GetCustomInteger4(1)
	local player = GetPlayer(dwID)
	if not player then
		return
	end
	local ghost = GetNpc(dwCharacterID)
	if not ghost then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	if not ghost.GetBuff(10957, 1) and ghost.GetBuff(11081, 1) and ghost.GetCustomUnsigned2(Identity_Wizard.Ghost.ValueName.dwOwnerID) == player.dwID then
		Identity_LonelyGhostSummon_Prepair(fazhen, player, ghost)		
	end
--[[	if tGhostSummon_Data[ghost.dwTemplateID] then
		--�ù��û�����ڱ��л�,��BUFF���
		if not ghost.GetBuff(10957, 1) then
			 --������ͣ�1.�ڱ�������2.ϵͳԤ�裬3.�������,4.�ε����
			if ghost.GetCustomInteger1(0) == 1 then
				local dwGhostMaster_ID = ghost.GetCustomInteger4(1)  --���������ҵ�ID
				local dwWizard_ID = fazhen.GetCustomInteger4(1)
				if dwGhostMaster_ID == dwWizard_ID then
					--ʩ�����Լ����ڱ����
					Identity_LonelyGhostSummon_Prepair(fazhen, player, ghost)
					return
				end
				local tPartyMember = player.GetPartyMemberList()
				if tPartyMember then
					for i = 1, #tPartyMember do
						if tPartyMember[i] == dwGhostMaster_ID then
							Identity_LonelyGhostSummon_Prepair(fazhen, player, ghost)
							--ʩ�����Ŷӳ�Ա���ڱ����
							return
						end
					end
				end
			elseif ghost.GetCustomInteger1(0) == 2 or ghost.GetCustomInteger1(0) == 4 then
				Identity_LonelyGhostSummon_Prepair(fazhen, player, ghost)
				return
			end
		end
	end--]]
end
--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
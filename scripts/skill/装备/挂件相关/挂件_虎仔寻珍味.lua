---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/�Ҽ����/�Ҽ�_����Ѱ��ζ.lua
-- ����ʱ��:	2017/3/17 16:16:21
-- �����û�:	ZHANGYAN0-PC
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 1
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 2
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 3
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 4
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 5
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 6
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 7
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 8
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 9
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, -- level 10
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/װ��/�Ҽ����/�Ҽ�_����Ѱ��ζ.lua",
		0
	);

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	skill.SetPublicCoolDown(16); -- ����CD 1.5��

	skill.SetNormalCoolDown(1, 1188); -- Ѱ��ζCD������ͨCD

	----------------- ����������� ---------------------------------------------
	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE; -- ����ʩ�ŵ���С����
	skill.nMaxRadius = 4 * LENGTH_BASE; -- ����ʩ�ŵ�������
	----------------- ���÷�Χ -------------------------------------------------
	-- skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	-- skill.nHeight = 0 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	-- skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	skill.nAngleRange = 256; -- ������Χ�����νǶȷ�Χ
	-- skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶
	-- skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult) -- �ж���ҵ�״̬�����ж��Ƿ���Է�������
	if player.dwBackItemIndex ~= 20987 and player.dwBackItemIndex ~= 20988 then--������ʱ���ж�
		return SKILL_RESULT_CODE.FAILED
	end

	if player.dwModelID ~= 0 then -- ����ǲ��ǻ�װ��
		return SKILL_RESULT_CODE.FAILED
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
	if not player then
		return
	end
	if player.dwBackItemIndex ~= 20987 and player.dwBackItemIndex ~= 20988 then--������ʱ���ж�
		return
	end

	player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 0)
	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "CloseNewPetSkillPanel")
	-- �ٻ�����
	player.GetScene().CreateFellowPet(56172, player.nX + 30, player.nY + 30, player.nZ + 30, 0, - 1, player.dwID)
	if player.dwFellowPetID == 0 then
		return
	end
	local npc = GetNpc(player.dwFellowPetID)
	if npc then
		npc.SetDisappearFrames(16 * 60 * 10)

		player.SetTimer(60 * 10 * GLOBAL.GAME_FPS, "scripts/skill/װ��/�Ҽ����/�Ҽ�_����Ѱ��ζ.lua", 0, 0)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnTimer(player, nParam1, nParam2)
	local scene = player.GetScene()
	if not scene then
		return
	end
	if player.dwBackItemIndex == 20987 or player.dwBackItemIndex == 20988 then--������ʱ���ж�
		player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 382)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
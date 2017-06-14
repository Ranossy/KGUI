---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�ؽ�/�ؽ�_��彣ʽ_Ϧ���׷�.lua
-- ����ʱ��:	2015/9/12 12:43:23
-- �����û�:	mengxiangfei11
-- �ű�˵��:

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 20, nDamageBase = 45, nDamageRand = 5}, -- Level 1
	{nAddRage = 0, nCostRage = 20, nDamageBase = 73, nDamageRand = 8}, -- Level 2
	{nAddRage = 0, nCostRage = 20, nDamageBase = 101, nDamageRand = 10}, -- Level 3
	{nAddRage = 0, nCostRage = 20, nDamageBase = 129, nDamageRand = 13}, -- Level 4
	{nAddRage = 0, nCostRage = 20, nDamageBase = 157, nDamageRand = 16}, -- Level 5
	{nAddRage = 0, nCostRage = 20, nDamageBase = 185, nDamageRand = 19}, -- Level 6
	{nAddRage = 0, nCostRage = 20, nDamageBase = 213, nDamageRand = 22}, -- Level 7
	{nAddRage = 0, nCostRage = 20, nDamageBase = 241, nDamageRand = 24}, -- Level 8
	{nAddRage = 0, nCostRage = 20, nDamageBase = 269, nDamageRand = 27}, -- Level 9
	{nAddRage = 0, nCostRage = 20, nDamageBase = 297, nDamageRand = 30}, -- Level 10
	{nAddRage = 0, nCostRage = 20, nDamageBase = 325, nDamageRand = 33}, -- Level 11
	{nAddRage = 0, nCostRage = 20, nDamageBase = 353, nDamageRand = 36}, -- Level 12
	{nAddRage = 0, nCostRage = 20, nDamageBase = 381, nDamageRand = 38}, -- Level 13
	{nAddRage = 0, nCostRage = 20, nDamageBase = 409, nDamageRand = 41}, -- Level 14
	{nAddRage = 0, nCostRage = 20, nDamageBase = 437, nDamageRand = 44}, -- Level 15
	{nAddRage = 0, nCostRage = 20, nDamageBase = 465, nDamageRand = 47}, -- Level 16
	{nAddRage = 0, nCostRage = 20, nDamageBase = 493, nDamageRand = 50}, -- Level 17
	{nAddRage = 0, nCostRage = 20, nDamageBase = 521, nDamageRand = 52}, -- Level 18
	{nAddRage = 0, nCostRage = 20, nDamageBase = 549, nDamageRand = 55}, -- Level 19
	{nAddRage = 0, nCostRage = 20, nDamageBase = 577, nDamageRand = 58}, -- Level 20
	{nAddRage = 0, nCostRage = 20, nDamageBase = 605, nDamageRand = 61}, -- Level 21
	{nAddRage = 0, nCostRage = 20, nDamageBase = 633, nDamageRand = 64}, -- Level 22
	{nAddRage = 0, nCostRage = 20, nDamageBase = 661, nDamageRand = 66}, -- Level 23
	{nAddRage = 0, nCostRage = 20, nDamageBase = 689, nDamageRand = 69}, -- Level 24
	{nAddRage = 0, nCostRage = 20, nDamageBase = 717, nDamageRand = 72}, -- Level 25
	{nAddRage = 0, nCostRage = 20, nDamageBase = 745, nDamageRand = 75}, -- Level 26
	{nAddRage = 0, nCostRage = 20, nDamageBase = 773, nDamageRand = 78}, -- Level 27
	{nAddRage = 0, nCostRage = 20, nDamageBase = 801, nDamageRand = 80}, -- Level 28
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		2896,
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		2897,
		dwSkillLevel
	);
	--�ͷ�AOE�Ӽ���
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/�ؽ�/�ؽ�_��彣ʽ_Ϧ���׷�.lua",
		0
	);
--Ӳֱ�Ӽ���
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	--ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
	--1739,
	--1
	--);
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);
	--skill.SetNormalCoolDown(1, 335);
	skill.SetCheckCoolDown(1, 444);
	----------------- ���ü������� ---------------------------------------------------------------------
	skill.nCostRage = 20;

	----------------- ����������� ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	--skill.nChannelInterval	= 72;
	skill.nMinRadius = 0 * LENGTH_BASE;					--����ʩ����С�뾶
	skill.nMaxRadius = 8 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 128; 										--ʩ�ŽǶ�,ȫ��256
	skill.nWeaponDamagePercent = 2048;
	skill.nPrepareFrames = 24;										--����֡��,16֡����1��
	skill.nMinPrepareFrames = 1;
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡

	----------------- ���˴��������� -------------------------------------------------
	skill.nBeatBackRate = 0 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
	--skill.nBrokenRate         = 1 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024

	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)
	if nPreResult == SKILL_RESULT_CODE.SUCCESS then
		player.AddBuff(0, 99, 2027, 1)
		return nPreResult
	end
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(3837)
	end
	--��������ָ������
	local nQuestIndex = player.GetQuestIndex(13254)
	local nQuestPhase = player.GetQuestPhase(13254)
	if nQuestIndex and nQuestPhase == 1 then
		player.SetQuestValue(nQuestIndex, 1, skill.dwLevel)
	end
end

function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end

	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end

	if not target then
		return
	end
	if player.GetSkillLevel(5960) == 1 then
		local nlev = player.GetSkillLevel(1600)
		if nlev ~= 0 then
			target.AddBuff(player.dwID, player.nLevel, 9706, 1)
			--player.CastSkill(14611, nlev, player.GetSkillTarget())
			player.CastSkillXYZ(14611, nlev, target.nX, target.nY, target.nZ)
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
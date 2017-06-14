---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�ؽ�/�ؽ�_���ӷ�_�ϳ�.lua
-- ����ʱ��:	2014/6/29 16:39:44
-- �����û�:	mengxiangfei
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  �ؽ�_���ӷ�_�ϳ�.lua
-- ������    :  zhangqi
-- ����ʱ��  :  2010-01-27
-- ��;(ģ��):  �书����
-- �书����  :  �ؽ�
-- �书����  :  �⹦
-- �书��·  :  ���ӷ�
-- ��������  :  �ϳ�
-- ����Ч��  :  һ��ն��Ǯ�������ɼ��������
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 20, nDamage = 14 * 0.95, nDamageRand = 14 * 0.1, nThreat = 259 * 2 }, -- Level 1
	{nAddRage = 0, nCostRage = 20, nDamage = 23 * 0.95, nDamageRand = 23 * 0.1, nThreat = 389 * 2 }, -- Level 2
	{nAddRage = 0, nCostRage = 20, nDamage = 31 * 0.95, nDamageRand = 31 * 0.1, nThreat = 518 * 2 }, -- Level 3
	{nAddRage = 0, nCostRage = 20, nDamage = 39 * 0.95, nDamageRand = 39 * 0.1, nThreat = 648 * 2 }, -- Level 4
	{nAddRage = 0, nCostRage = 20, nDamage = 47 * 0.95, nDamageRand = 47 * 0.1, nThreat = 778 * 2 }, -- Level 5
	{nAddRage = 0, nCostRage = 20, nDamage = 54 * 0.95, nDamageRand = 54 * 0.1, nThreat = 907 * 2 }, -- Level 6
	{nAddRage = 0, nCostRage = 20, nDamage = 62 * 0.95, nDamageRand = 62 * 0.1, nThreat = 1037 * 2 }, -- Level 7
	{nAddRage = 0, nCostRage = 20, nDamage = 70 * 0.95, nDamageRand = 70 * 0.1, nThreat = 1166 * 2 }, -- Level 8
	{nAddRage = 0, nCostRage = 20, nDamage = 78 * 0.95, nDamageRand = 78 * 0.1, nThreat = 1296 * 2 }, -- Level 9
	{nAddRage = 0, nCostRage = 20, nDamage = 86 * 0.95, nDamageRand = 86 * 0.1, nThreat = 1426 * 2 }, -- Level 10
	{nAddRage = 0, nCostRage = 20, nDamage = 94 * 0.95, nDamageRand = 94 * 0.1, nThreat = 259 * 2 }, -- Level 11
	{nAddRage = 0, nCostRage = 20, nDamage = 103 * 0.95, nDamageRand = 103 * 0.1, nThreat = 389 * 2 }, -- Level 12
	{nAddRage = 0, nCostRage = 20, nDamage = 111 * 0.95, nDamageRand = 111 * 0.1, nThreat = 518 * 2 }, -- Level 13
	{nAddRage = 0, nCostRage = 20, nDamage = 129 * 0.95, nDamageRand = 129 * 0.1, nThreat = 648 * 2 }, -- Level 14
	{nAddRage = 0, nCostRage = 20, nDamage = 137 * 0.95, nDamageRand = 137 * 0.1, nThreat = 778 * 2 }, -- Level 15
	{nAddRage = 0, nCostRage = 20, nDamage = 144 * 0.95, nDamageRand = 144 * 0.1, nThreat = 907 * 2 }, -- Level 16
	{nAddRage = 0, nCostRage = 20, nDamage = 152 * 0.95, nDamageRand = 152 * 0.1, nThreat = 1037 * 2 }, -- Level 17

};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = 17;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamage,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		1722,
		1
	);
	skill.AddAttribute(														--2010.07.27��ӳ��似��
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1883,
		1
		);
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CLEAR_COOL_DOWN,
		363,
		0
		);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/�ؽ�/�ؽ�_���ӷ�_�ϳ�.lua",
		0
	);
	--skill.nBaseThreat = tSkillData[dwSkillLevel].nThreat;
	----------------- ����CoolDown --------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);
	skill.SetNormalCoolDown(1, 383);
	skill.AddSlowCheckSelfBuff(1722, 1, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
	skill.SetCheckCoolDown(1, 444)
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;

	----------------- ����������� ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 160;
	elseif dwSkillLevel < 14 then
		skill.nChannelInterval = 160;
	elseif dwSkillLevel < 17 then
		skill.nChannelInterval = 160
	else
		skill.nChannelInterval = 160; 				-- ͨ�������ʱ��
	end
	--skill.nChannelInterval = 160;
	skill.nMinRadius = 0 * LENGTH_BASE;					--����ʩ����С�뾶
	skill.nMaxRadius = 4 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 128; 										--ʩ�ŽǶ�,ȫ��256
	--skill.nAreaRadius		= 6 * LENGTH_BASE;
	skill.nWeaponDamagePercent = 2048;
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��

	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡

	skill.nBreakRate = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
	--	skill.nTargetCountLimit	= 1;
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
	-- if skill.dwLevel == 10 then
	-- player.AcquireAchievement(1363)
	-- end
end
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	if player.GetSkillLevel(9289) == 1 then
		player.ClearCDTime(363)
	end
	--if player.GetSkillLevel(9287) == 1 then
	--player.AddBuff(player.dwID,player.nLevel,7971,1)
	--end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
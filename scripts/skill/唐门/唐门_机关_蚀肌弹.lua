---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����_����_ʴ����.lua
-- ����ʱ��:	2017/3/29 12:00:51
-- �����û�:	chenchen6-pc
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- ������   :  �ź�
-- ����ʱ��	:  2011-8-16
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 20, nDamageRand = 5, nCostMana = 0}, --level 1
	{nDamageBase = 25, nDamageRand = 5, nCostMana = 0}, --level 2
	{nDamageBase = 30, nDamageRand = 5, nCostMana = 0}, --level 3
	{nDamageBase = 35, nDamageRand = 5, nCostMana = 0}, --level 4
	{nDamageBase = 40, nDamageRand = 5, nCostMana = 0}, --level 5
	{nDamageBase = 45, nDamageRand = 5, nCostMana = 0}, --level 6
	{nDamageBase = 50, nDamageRand = 5, nCostMana = 0}, --level 7
	{nDamageBase = 55, nDamageRand = 10, nCostMana = 0}, --level 8
	{nDamageBase = 60, nDamageRand = 10, nCostMana = 0}, --level 9
	{nDamageBase = 65, nDamageRand = 10, nCostMana = 0}, --level 10
	{nDamageBase = 70, nDamageRand = 10, nCostMana = 0}, --level 11
	{nDamageBase = 75, nDamageRand = 10, nCostMana = 0}, --level 12
	{nDamageBase = 80, nDamageRand = 10, nCostMana = 0}, --level 13
	{nDamageBase = 85, nDamageRand = 10, nCostMana = 0}, --level 14
	{nDamageBase = 90, nDamageRand = 15, nCostMana = 0}, --level 15
	{nDamageBase = 95, nDamageRand = 15, nCostMana = 0}, --level 16
	{nDamageBase = 100, nDamageRand = 15, nCostMana = 0}, --level 17
	{nDamageBase = 105, nDamageRand = 15, nCostMana = 0}, --level 18
	{nDamageBase = 110, nDamageRand = 15, nCostMana = 0}, --level 19
	{nDamageBase = 115, nDamageRand = 15, nCostMana = 0}, --level 20
	{nDamageBase = 120, nDamageRand = 20, nCostMana = 0}, --level 21
	{nDamageBase = 125, nDamageRand = 20, nCostMana = 0}, --level 22
	{nDamageBase = 130, nDamageRand = 20, nCostMana = 0}, --level 23
	{nDamageBase = 140, nDamageRand = 20, nCostMana = 0}, --level 24
	{nDamageBase = 150, nDamageRand = 20, nCostMana = 0}, --level 25
	{nDamageBase = 160, nDamageRand = 20, nCostMana = 0}, --level 26
	{nDamageBase = 180, nDamageRand = 20, nCostMana = 0}, --level 27
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_POISON_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_POISON_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_POISON_DAMAGE,
		0,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.PHYSICS_ATTACK_POWER_PERCENT,
 - 1024,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/����_����_ʴ����.lua",
		0
	);

	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- �������������Լ���Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- ����Ŀ�������Լ���Buff

	-----------------����ʩ�ż�������-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetNormalCoolDown(1, 466);	--������ͨCD
	skill.SetCheckCoolDown(1, 444);	--ֻ��鲻�ߵ�CD
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- ���ܳ�� -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- �������� -------------------------------------------------
	skill.nCostEnergy = 25;							-- �������ĵ�����
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
	--skill.nCostStamina	= 0;									-- �������ĵ�����
	--skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID

	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨

	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 20 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 128;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	skill.nPrepareFrames = 28;				-- ����֡��

	if dwSkillLevel < 10 then
		skill.nChannelInterval = 16 * 1.2 * 1.1 * 1.05;
	elseif dwSkillLevel < 27 then
		skill.nChannelInterval = (16 + (dwSkillLevel - 9) * 4) * 1.2 * 1.1 * 1.05
	else
		skill.nChannelInterval = 108 * 1.2 * 1.1 * 1.05;     -- ͨ�������ʱ��
	end
	--skill.nChannelInterval = 88; 				-- ͨ�������ʱ��
	skill.nMinPrepareFrames = 1;
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nBulletVelocity		= 120;				-- �ӵ��ٶȣ���λ ��/֡

	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���

	----------------- Ŀ��Ѫ������ ---------------------------------------------
	--skill.nTargetLifePercentMin	= 0;			-- Ѫ����Сֵ>=
	--skill.nTargetLifePercentMax	= 100;			-- Ѫ�����ֵ<=

	----------------- ����Ѫ������ ---------------------------------------------
	--skill.nSelfLifePercentMin	= 0;				-- Ѫ����Сֵ>=
	--skill.nSelfLifePercentMax	= 100;				-- Ѫ�����ֵ<=

	----------------- ���˴��������� -------------------------------------------------
	--skill.nBeatBackRate       = 1 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
	--skill.nBrokenRate         = 1 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024

	--skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0

	----------------- �����˺���� ---------------------------------------------
	skill.nWeaponDamagePercent = 1024;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

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
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(2713)
	end
	-- if player.IsAchievementAcquired(2709) and player.IsAchievementAcquired(2710) and player.IsAchievementAcquired(2711) and player.IsAchievementAcquired(2712) and player.IsAchievementAcquired(2713) and player.IsAchievementAcquired(2714) then
	-- player.AcquireAchievement(2715)
	-- end
	--��������ָ������
	local nQuestIndex = player.GetQuestIndex(13256)
	local nQuestPhase = player.GetQuestPhase(13256)
	if nQuestIndex and nQuestPhase == 1 then
		player.SetQuestValue(nQuestIndex, 1, skill.dwLevel)
	end
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	--[[
	if player.GetBuff(8517, 1) then
		player.DelBuff(8517, 1)
	end
	--]]
	if player.GetBuff(11838, 1) then
		player.DelBuff(11838, 1)
	elseif
		player.GetBuff(3281, 1) then
		player.DelBuff(3281, 1)
	end

	if player.GetBuff(11766, 1) then
		local buff = player.GetBuff(11766, 1)
		local nCount = buff.nLeftActiveCount
		player.DelBuff(11766, 1)
		player.AddBuff(player.dwID, player.nLevel, 3281, 1, nCount)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
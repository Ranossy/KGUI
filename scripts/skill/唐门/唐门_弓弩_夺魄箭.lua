---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����_����_���Ǽ�.lua
-- ����ʱ��:	2014/7/23 11:45:04
-- �����û�:	mengxiangfei
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
	{nDamageBase = 44, nDamageRand = 5, nCostMana = 0}, --level 1
	{nDamageBase = 55, nDamageRand = 5, nCostMana = 0}, --level 2
	{nDamageBase = 64, nDamageRand = 5, nCostMana = 0}, --level 3
	{nDamageBase = 76, nDamageRand = 5, nCostMana = 0}, --level 4
	{nDamageBase = 85, nDamageRand = 5, nCostMana = 0}, --level 5
	{nDamageBase = 94, nDamageRand = 5, nCostMana = 0}, --level 6
	{nDamageBase = 107, nDamageRand = 5, nCostMana = 0}, --level 7
	{nDamageBase = 118, nDamageRand = 5, nCostMana = 0}, --level 8
	{nDamageBase = 125, nDamageRand = 5, nCostMana = 0}, --level 9
	{nDamageBase = 135, nDamageRand = 5, nCostMana = 0}, --level 10
	{nDamageBase = 145, nDamageRand = 10, nCostMana = 0}, --level 11
	{nDamageBase = 155, nDamageRand = 10, nCostMana = 0}, --level 12
	{nDamageBase = 165, nDamageRand = 10, nCostMana = 0}, --level 13
	{nDamageBase = 175, nDamageRand = 10, nCostMana = 0}, --level 14
	{nDamageBase = 185, nDamageRand = 10, nCostMana = 0}, --level 15
	{nDamageBase = 190, nDamageRand = 15, nCostMana = 0}, --level 16
	{nDamageBase = 200, nDamageRand = 15, nCostMana = 0}, --level 17
	{nDamageBase = 205, nDamageRand = 15, nCostMana = 0}, --level 18
	{nDamageBase = 210, nDamageRand = 15, nCostMana = 0}, --level 19
	{nDamageBase = 215, nDamageRand = 15, nCostMana = 0}, --level 20
	{nDamageBase = 220, nDamageRand = 15, nCostMana = 0}, --level 21
	{nDamageBase = 225, nDamageRand = 15, nCostMana = 0}, --level 22
	{nDamageBase = 230, nDamageRand = 20, nCostMana = 0}, --level 23
	{nDamageBase = 235, nDamageRand = 20, nCostMana = 0}, --level 24
	{nDamageBase = 240, nDamageRand = 20, nCostMana = 0}, --level 25
	{nDamageBase = 245, nDamageRand = 20, nCostMana = 0}, --level 26
	{nDamageBase = 250, nDamageRand = 20, nCostMana = 0}, --level 27
	{nDamageBase = 255, nDamageRand = 20, nCostMana = 0}, --level 28
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase,
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
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL, -- ��ɢ��˲��buff
		5781,
		1
	);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL,
		3384,
		1
	);
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL,
		9426,
		1
	);
	--]]
	--��ħЧ��
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/����_����_���Ǽ�.lua",
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
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	--������ͨCD
	--skill.SetNormalCoolDown(1, 974);	--������ͨCD
	skill.SetCheckCoolDown(1, 444);	--ֻ��鲻�ߵ�CD
	skill.SetCheckCoolDown(2, 974);	--ֻ��鲻�ߵ�CD
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- ���ܳ�� -------------------------------------------------
	--skill.nThreat		= 0;

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
	--skill.nCostStamina	= 0;									-- �������ĵ�����
	--skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID
	skill.nCostEnergy = 25;
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨

	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 25 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 128;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius		= 0 * LENGTH_;		-- �������ð뾶
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	skill.nPrepareFrames = 28;
	skill.nMinPrepareFrames = 1;-- ����֡��

	if dwSkillLevel < 7 then
		skill.nChannelInterval = 32*1.15;
	elseif dwSkillLevel < 28 then
		skill.nChannelInterval = (32 + (dwSkillLevel - 6) * 5)*1.15
	else
		skill.nChannelInterval = 155*1.15;     -- ͨ�������ʱ��
	end
	--skill.nChannelInterval = 168; 				-- ͨ�������ʱ��
	--skill.nMinChannelInterval	= 1;
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nBulletVelocity		= 240;				-- �ӵ��ٶȣ���λ ��/֡

	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���

	----------------- Ŀ��Ѫ������ ---------------------------------------------
	--skill.nTargetLifePercentMin	= 0;			-- Ѫ����Сֵ>=
	--skill.nTargetLifePercentMax	= 100;			-- Ѫ�����ֵ<=

	----------------- ����Ѫ������ ---------------------------------------------
	--skill.nSelfLifePercentMin	= 0;				-- Ѫ����Сֵ>=
	--skill.nSelfLifePercentMax	= 100;				-- Ѫ�����ֵ<=

	----------------- ���˴��������� -------------------------------------------------
	--skill.nBeatBackRate       = 1 * PERCENT_;		-- ���ܱ����˵ĸ���,Ĭ��1024
	--skill.nBrokenRate         = 1 * PERCENT_;		-- ���ܱ���ϵĸ���,Ĭ��1024
	--skill.nBreakRate			= 0 * PERCENT_;		-- ���Ŀ��ʩ���ĸ���,����1024

	--skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0

	----------------- �����˺���� ---------------------------------------------
	skill.nWeaponDamagePercent = 2048;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

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
		player.AcquireAchievement(2711)
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

	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	if not target then
		return
	end

	--˲��ɾ��ͳһ�����ﴦ��
	if player.GetBuff(5781, 1) then
		player.DelBuff(5781, 1)
	elseif player.GetBuff(11872, 1)then
		player.DelBuff(11872, 1)
	end

	if player.GetSkillLevel(9308) == 1 then
		player.CastSkill(9426,1)
	end

	--��������ͬһĿ��Ч�����
	if player.GetSkillLevel(6439) == 1 then
		local nbuff = player.GetBuff(9843, 1)	--�״�����Ŀ���ı��
		local nbuff_1 = player.GetBuff(9844, 1)	--ʵ������Ч��

		if not nbuff and not nbuff_1 then
			player.AddBuff(target.dwID, target.nLevel, 9843, 1)
		elseif nbuff then
			local nID = nbuff.dwSkillSrcID
			if nID == dwCharacterID then
				player.DelBuff(9843, 1)
				player.AddBuff(target.dwID, target.nLevel, 9844, 1)
			else
				player.DelBuff(9843, 1)
				player.AddBuff(target.dwID, target.nLevel, 9843, 1)
			end
		elseif nbuff_1 then
			local nID = nbuff_1.dwSkillSrcID
			if nID == dwCharacterID then
				player.AddBuff(target.dwID, target.nLevel, 9844, 1)
			else
				player.DelBuff(9844, 1)
			end
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
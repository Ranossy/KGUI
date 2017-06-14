---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��·���Ӽ���/����_������_����.lua
-- ����ʱ��:	2014/11/19 17:37:27
-- �����û�:	zhouyixiao2
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 20, nDamageRand = 20 * 0.1, nCostMana = 0}, --level 1
	{nDamageBase = 30, nDamageRand = 30 * 0.1, nCostMana = 0}, --level 2
	{nDamageBase = 40, nDamageRand = 40 * 0.1, nCostMana = 0}, --level 3
	{nDamageBase = 50, nDamageRand = 50 * 0.1, nCostMana = 0}, --level 4
	{nDamageBase = 60, nDamageRand = 60 * 0.1, nCostMana = 0}, --level 5
	{nDamageBase = 70, nDamageRand = 70 * 0.1, nCostMana = 0}, --level 6
	{nDamageBase = 80, nDamageRand = 80 * 0.1, nCostMana = 0}, --level 7
	{nDamageBase = 90, nDamageRand = 90 * 0.1, nCostMana = 0}, --level 8
	{nDamageBase = 100, nDamageRand = 100 * 0.1, nCostMana = 0}, --level 9
	{nDamageBase = 110, nDamageRand = 110 * 0.1, nCostMana = 0}, --level 10
	{nDamageBase = 120, nDamageRand = 120 * 0.1, nCostMana = 0}, --level 11
	{nDamageBase = 130, nDamageRand = 130 * 0.1, nCostMana = 0}, --level 12
	{nDamageBase = 140, nDamageRand = 140 * 0.1, nCostMana = 0}, --level 13
	{nDamageBase = 150, nDamageRand = 150 * 0.1, nCostMana = 0}, --level 14
	{nDamageBase = 160, nDamageRand = 160 * 0.1, nCostMana = 0}, --level 15
	{nDamageBase = 170, nDamageRand = 170 * 0.1, nCostMana = 0}, --level 16
	{nDamageBase = 180, nDamageRand = 180 * 0.1, nCostMana = 0}, --level 17
	{nDamageBase = 190, nDamageRand = 190 * 0.1, nCostMana = 0}, --level 18
	{nDamageBase = 200, nDamageRand = 200 * 0.1, nCostMana = 0}, --level 19
	{nDamageBase = 210, nDamageRand = 210 * 0.1, nCostMana = 0}, --level 20
	{nDamageBase = 220, nDamageRand = 220 * 0.1, nCostMana = 0}, --level 21
	{nDamageBase = 230, nDamageRand = 230 * 0.1, nCostMana = 0}, --level 22
	{nDamageBase = 240, nDamageRand = 240 * 0.1, nCostMana = 0}, --level 23
	{nDamageBase = 250, nDamageRand = 250 * 0.1, nCostMana = 0}, --level 24
	{nDamageBase = 260, nDamageRand = 260 * 0.1, nCostMana = 0}, --level 25
	{nDamageBase = 270, nDamageRand = 270 * 0.1, nCostMana = 0}, --level 26
	{nDamageBase = 280, nDamageRand = 280 * 0.1, nCostMana = 0}, --level 27
	{nDamageBase = 290, nDamageRand = 290 * 0.1, nCostMana = 0}, --level 28
	{nDamageBase = 300, nDamageRand = 300 * 0.1, nCostMana = 0}, --level 29
	{nDamageBase = 310, nDamageRand = 310 * 0.1, nCostMana = 0}, --level 30
	{nDamageBase = 320, nDamageRand = 320 * 0.1, nCostMana = 0}, --level 31
	{nDamageBase = 330, nDamageRand = 330 * 0.1, nCostMana = 0}, --level 32
	{nDamageBase = 350, nDamageRand = 350 * 0.1, nCostMana = 0}, --level 33
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

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_MOVE,
		103,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_MOVE,
		102,
		1						--1���Լ���0��Ŀ��
	);

	--[[skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_KNOCKED_OFF_PARABOLA,
		335,
		4
	);--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/��·���Ӽ���/����_������_����.lua",
		0
	);

	--[[skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/װ��/�̻�Ͳ_����_����.lua",
		0
	);	--]]

	----------------- ����ʩ��Buff���� ---------------------------------------------
	skill.AddSlowCheckSelfBuff(8265, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);	--���ƶ�ǽ
	skill.AddSlowCheckSelfBuff(8441, 1, BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL);	--������
	skill.AddSlowCheckDestOwnBuff(8467, 1, BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL);		-- ������
	--skill.AddSlowCheckSelfOwnBuff(8441, 1, BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL);		-- ������
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- ����Ŀ�������Լ���Buff

	-----------------����ʩ�ż�������-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�
	skill.nNeedPoseState = 2
	-----------------���ܽ������-------------------------------------------
	--skill.nAttackAttenuationCof = 0;     --�����˺�����ٷֱȣ�1024Ϊ100%������Ϊ���ӣ�����Ϊ���١�ע��˲���ֻ���ڽ������͵�AOE��ʹ�ã�
	--skill.SetSubSkillForAreaDepth(1,dwSkillID,dwSkillLevel);  --�Ե�һ����������Ŀ��ʩ���Ӽ��ܡ�ע��˲���ֻ���ڽ������͵�AOE��ʹ�ã�
	--skill.SetSubSkillForAreaDepth(2,dwSkillID,dwSkillLevel);  --�Եڶ�����������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(3,dwSkillID,dwSkillLevel);  --�Ե�������������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(4,dwSkillID,dwSkillLevel);  --�Ե��ĸ���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(5,dwSkillID,dwSkillLevel);  --�Ե������������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(6,dwSkillID,dwSkillLevel);  --�Ե�������������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(7,dwSkillID,dwSkillLevel);  --�Ե��߸���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(8,dwSkillID,dwSkillLevel);  --�Եڰ˸���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(9,dwSkillID,dwSkillLevel);  --�ԵھŸ���������Ŀ��ʩ���Ӽ��ܡ�
	--skill.SetSubSkillForAreaDepth(10,dwSkillID,dwSkillLevel);  --�Ե�ʮ����������Ŀ��ʩ���Ӽ��ܡ�

	----------------- BUFF��� -------------------------------------------------
	--  skill.BindBuff(1, 5160, 1);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	skill.SetPublicCoolDown(16);
	skill.SetNormalCoolDown(1, 829);	--������ͨCD
	--skill.SetNormalCoolDown(2, 804);	--������ͨCD
	skill.SetCheckCoolDown(1, 804);	--ֻ��鲻�ߵ�CD
	skill.SetCheckCoolDown(2, 16);	--ֻ��鲻�ߵ�CD
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- ���ܳ�� -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
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
	skill.nMaxRadius = 4 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius = 8 * LENGTH_BASE;		-- �������ð뾶
	skill.nTargetCountLimit = 1;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	if dwSkillLevel < 5 then
		skill.nChannelInterval = 16;
	elseif dwSkillLevel < 33 then
		skill.nChannelInterval = 16 + (dwSkillLevel - 4) * 3;
	else
		skill.nChannelInterval = 100;     -- ͨ�������ʱ��
	end
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	--skill.nChannelInterval	= 0; 				-- ͨ�������ʱ��
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡

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
	--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

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
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	if not player then
		return SKILL_RESULT_CODE.FAILED
	end
	local TargetType, TargetID = player.GetTarget()
	if TargetType == TARGET.NO_TARGET then
		return SKILL_RESULT_CODE.FAILED
	end

	local target
	if TargetType == TARGET.PLAYER then
		target = GetPlayer(TargetID)
	elseif TargetType == TARGET.NPC then
		target = GetNpc(TargetID)
	end

	if not target then
		return SKILL_RESULT_CODE.FAILED
	end

	player.TurnToCharacter(target.dwID)

	if target.nImmuneSkillMoveCount == 0 then
		target.TurnToCharacter(player.dwID)
		--player.AdjustPlayerDistance(target.dwID,128)
	end
	player.DelBuff(8441, 1)
	local nTarget
	if IsPlayer(dwCharacterID) then
		nTarget = GetPlayer(dwCharacterID)
	--	nTarget.SetTimer(32, "scripts/skill/����/��·���Ӽ���/����_������_����.lua", nTarget.dwID, 0)
	else
		nTarget = GetNpc(dwCharacterID)
	end

	if nTarget.nImmuneSkillMoveCount == 0 then
		nTarget.BeHitted(player.dwID, 13069, 1, 30)
		nTarget.AddBuff(0, 99, 8566, 1, 4)
	end
	player.AddBuff(0, 99, 8483, 1, 2)

	--player.AddBuff(0, 99, 7338, 1) --������
	--player.DoAction(dwCharacterID, 12112) --������յĶ���
end
--function OnTimer(player, nParam1, nParam2)
	--local nTarget = GetPlayer(nParam1)
	--if not nTarget then
		--return
	--end
	--nTarget.DoAction(0, 55163)
--end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
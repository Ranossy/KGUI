---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��·���Ӽ���/����_��_�乬����.lua
-- ����ʱ��:	2015/8/10 19:15:28
-- �����û�:	mengxiangfei11
-- �ű�˵��:

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nTherapy = 150 / 3 * 0.95, nTherapyRand = 150 / 3 * 0.1, nCostMana = 42 },
	{nTherapy = 187 / 3 * 0.95, nTherapyRand = 187 / 3 * 0.1, nCostMana = 42 },
	{nTherapy = 224 / 3 * 0.95, nTherapyRand = 224 / 3 * 0.1, nCostMana = 61 },
	{nTherapy = 261 / 3 * 0.95, nTherapyRand = 261 / 3 * 0.1, nCostMana = 88 },
	{nTherapy = 298 / 3 * 0.95, nTherapyRand = 298 / 3 * 0.1, nCostMana = 108},
	{nTherapy = 335 / 3 * 0.95, nTherapyRand = 335 / 3 * 0.1, nCostMana = 129},
	{nTherapy = 372 / 3 * 0.95, nTherapyRand = 372 / 3 * 0.1, nCostMana = 149},
	{nTherapy = 409 / 3 * 0.95, nTherapyRand = 409 / 3 * 0.1, nCostMana = 170},
	{nTherapy = 446 / 3 * 0.95, nTherapyRand = 446 / 3 * 0.1, nCostMana = 190},
	{nTherapy = 483 / 3 * 0.95, nTherapyRand = 483 / 3 * 0.1, nCostMana = 211},
	{nTherapy = 520 / 3 * 0.95, nTherapyRand = 520 / 3 * 0.1, nCostMana = 211},
	{nTherapy = 557 / 3 * 0.95, nTherapyRand = 557 / 3 * 0.1, nCostMana = 211},
	{nTherapy = 594 / 3 * 0.95, nTherapyRand = 594 / 3 * 0.1, nCostMana = 42 },
	{nTherapy = 631 / 3 * 0.95, nTherapyRand = 631 / 3 * 0.1, nCostMana = 42 },
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------
	--�������Ƽ���
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		14360,
		dwSkillLevel
		);
	--[[
	--Ŀ�������������������Ч��
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		14385,
		dwSkillLevel
	);
	--]]
	----------------- ����ʩ��Buff���� ---------------------------------------------
	skill.AddSlowCheckSelfBuff(9377, 1, BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL);		-- ��������Buff
	skill.AddSlowCheckSelfBuff(9506, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ��������Buff
	--���������ڼ�û�и�ɽ��ˮ��״̬�����ͷŹ���ı��buff
	skill.AddSlowCheckSelfBuff(9552, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- �������������Լ���Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- ����Ŀ�������Լ���Buff

	-----------------����ʩ�ż�������-------------------------------------------
	--skill.AddCheckSelfLearntSkill(14361, 0, SKILL_COMPARE_FLAG.EQUAL);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�

	-----------------����ʩ����̬����(����)----------------------------------------
	--skill.nNeedPoseState = 1    --�����̬��1Ϊ�浶��̬��2Ϊ�����̬

	----------------�����˺���С�ӻ�Ѫ------------------------------------------

	--skill.nDamageToLifeForParty = 0	--�����˺���С�ӳ�Ա�ٷֱȻ�Ѫ

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
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	--������ͨCD
	skill.SetCheckCoolDown(1, 444);	--ֻ��鲻�ߵ�CD
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- ���ܳ�� -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- �����Ƿ����������ʩ�� -------------------------------------------------
	--skill.bIgnorePrepareState = true	--�����Ƿ����������ʩ�ţ�������ͨ����������������true

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
	--skill.nCostMana      	= 150;	-- �������ĵ�����
	--skill.nCostStamina	= 0;									-- �������ĵ�����
	--skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 270 * 0.2;	-- �������ĵ�����
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 270 * 0.4;	-- �������ĵ�����
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 270 * 0.6;	-- �������ĵ�����
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 270 * 0.8;	-- �������ĵ�����
	else
		skill.nCostManaBasePercent = 270;	-- �������ĵ�����
	end
	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.nNeedAccumulateCount = 0;				-- ������Ҫ����ĸ�������skill.bIsAccumulate	= trueʱ��Ч
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨

	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 20 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	skill.nPrepareFrames = 28;				-- ����֡��
	skill.nMinPrepareFrames = 1;				-- ����Ч����С����֡����Ĭ����-1���������ܼ���Ӱ�졣���ڵ���0���ܼ���Ӱ�죬��С����ʱ��Ϊ���ֵ
	--skill.nChannelInterval	= 0; 				-- ͨ�������ʱ��
	--skill.nMinChannelInterval	= -1; 				-- ����Ч����Сͨ�������ʱ�䣺Ĭ����-1��ͨ�����ܼ���Ӱ�졣���ڵ���0���ܼ���Ӱ�죬��ͨ�����ʱ��Ϊ���ֵ
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nMinChannelFrame	= -1; 				-- ͨ����ϼ�����С���ʱ��ʹ�á�ʹ��ͨ������������١���������-1���������-1���߼��ٿ��Զ�1��
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
	skill.nBeatBackRate = 1 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
	skill.nBrokenRate = 1 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024

	--skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0

	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent = 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	--[[
	player.AddBuff(player.dwID, player.nLevel, 9430, 1, 12)	--������ѩ��������buff

	--ɾ��������ѩ�������津��Ч��
	for i = 1, 3 do
		player.DelBuff(9433, i)
		player.DelBuff(9434, i)
	end
	player.DelGroupBuff(10216, 1)
	player.DelGroupBuff(10217, 1)
	--]]
	if not player.GetBuff(9430, 1) then
		--print(6666)
		--ɾ��������ѩ�������津��Ч��
		for i = 1, 3 do
			player.DelBuff(9433, i)
			player.DelBuff(9434, i)
		end
		player.DelGroupBuff(10216, 1)
		player.DelGroupBuff(10217, 1)
		player.AddBuff(player.dwID, player.nLevel, 9430, 1, 12)	--������ѩ��������buff
	else
		--print(7777)
		player.DelBuff(9430, 1)
	end
	if nPreResult == SKILL_RESULT_CODE.SUCCESS then
		player.AddBuff(player.dwID, player.nLevel, 9430, 1, 12)	--������ѩ��������buff
		return nPreResult;
	end
	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)
	--local lv = skill.dwLevel

	--player.LearnSkillLevel(14300, lv, player.dwID)	--ѧϰ�乬����
	--player.LearnSkillLevel(14303, lv, player.dwID)	--ѧϰ������hot
end

--��������ʱִ�еĺ���,����skillΪ������skill
function OnSkillForgotten(skill, player)

end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	--[[
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

	local nbuffCount = 0
	--��һ��buff,Ӧ����4��һ��
	if target.GetBuffByOwner(9357, 1, player.dwID) or target.GetBuffByOwner(9358, 1, player.dwID) or target.GetBuffByOwner(9359, 1, player.dwID) or target.GetBuffByOwner(9360, 1, player.dwID) then
		nbuffCount = nbuffCount + 1
	end
	--��һ��buff
	if target.GetBuffByOwner(9361, 1, player.dwID) or target.GetBuffByOwner(9362, 1, player.dwID) or target.GetBuffByOwner(9363, 1, player.dwID) or target.GetBuffByOwner(9364, 1, player.dwID) then
		nbuffCount = nbuffCount + 1
	end
	--��һ��buff
	if target.GetBuffByOwner(9373, 1, player.dwID) or target.GetBuffByOwner(9374, 1, player.dwID) or target.GetBuffByOwner(9375, 1, player.dwID) or target.GetBuffByOwner(9376, 1, player.dwID) then
		nbuffCount = nbuffCount + 1
	end
	--ʦ�����Ŀ�������Լ�buff������̬��buff����
	if player.GetSkillLevel(14282) == 1 then
		player.DelGroupBuff(9355, 1)
		if nbuffCount ~= 0 then
			for i = 1, nbuffCount do
				player.AddBuff(player.dwID, player.nLevel, 9355, 1)
			end
		end
	end

	--ʫ�ϣ������ʵ��ӱ��buff
	if player.GetSkillLevel(14233) == 1 then
		local nRnd = Random(1, 10000)
		if nRnd <= 3500 then
			player.AddBuff(player.dwID, player.nLevel, 9329, 1)
		end
	end

	--��Ȫ�������������
	if player.GetSkillLevel(14284) == 1 then
		target.AddBuff(player.dwID, player.nLevel, 9356, 1)
	end

	--ɾ��������ѩ���������ж�buff
	if player.GetBuff(9430, 1) then
		player.DelBuff(9430, 1)
	end

	--ɾ��������ѩ�������津��Ч��
	for i = 1, 3 do
		player.DelBuff(9433, i)
		player.DelBuff(9434, i)
	end
	--]]
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��·���Ӽ���/����_��_ƽɳ������������.lua
-- ����ʱ��:	2016/11/18 16:03:54
-- �����û�:	XIAXIANBO1
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/Include/ClearCoolID.lh")

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
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.MODIFY_THREAT, -- ����һ����
		1,
		1
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/����/��·���Ӽ���/����_��_ƽɳ������������.lua", -- ����ֵ1
		0											-- ����ֵ2
	);

	----------------- ����ʩ��Buff���� ---------------------------------------------
	skill.AddSlowCheckSelfBuff(9506, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ��������Buff
	skill.AddSlowCheckSelfBuff(9322, 1, BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL);		-- ��������Buff
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- �������������Լ���Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- ����Ŀ�������Լ���Buff

	-----------------����ʩ�ż�������-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�

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
	--skill.BindBuff(1, 9322, 1);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetNormalCoolDown(1, 978);	--������ͨCD
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
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
	--skill.nCostStamina	= 0;									-- �������ĵ�����
	--skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID
	skill.nCostManaBasePercent = 1000;	-- �������ĵ�����
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
	skill.nMaxRadius = 25 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	skill.nAngleRange = 128;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	skill.nPrepareFrames = 48;				-- ����֡��
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
	--skill.nBeatBackRate       = 1 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
	--skill.nBrokenRate         = 1 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024

	--skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0

	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent = 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

	return true;
end

-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult) -- �ж���ҵ�״̬�����ж��Ƿ���Է�������
	local target = player.GetSelectCharacter()
	if not target then
		return SKILL_RESULT_CODE.FAILED
	end
	if not target or target.GetBuff(7049, 1)or target.GetBuff(10864, 1) or target.GetBuff(10472, 1) or target.GetBuff(7525, 1) or target.GetBuff(7525, 2) or target.GetBuff(7561, 1) or target.GetBuff(7561, 2) or target.GetBuff(9982, 1) or target.GetBuff(10224, 1) or target.GetBuff(10225, 1) or target.GetBuff(9506, 1) or target.GetBuff(4964, 2) or target.GetBuff(11594, 0) or target.nMoveState == MOVE_STATE.ON_AUTO_FLY or target.dwShapeShiftID ~= 0 then
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_YELLOW", GetEditorString(9, 161), 4)
		return SKILL_RESULT_CODE.FAILED
	end
	if nPreResult == SKILL_RESULT_CODE.SUCCESS then

		player.AddBuff(player.dwID, player.nLevel, 10791, 1)
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
function Apply(dwCharacterID, dwSkillSrcID)
	--print(33333333)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	--print(111111)
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	if not target then
		return
	end
	player.DelBuff(10791, 1)
	--print(222222)
	--��¼CD
	target.Stop()
	target.BackupCoolDown()
	--����Ŀ��CD
	for i = 1, #tCoolID do	--���CD
		if tCoolID[i] ~= 37 and tCoolID[i] ~= 152 and tCoolID[i] ~= 153 and tCoolID[i] ~= 155 and tCoolID[i] ~= 154 and tCoolID[i] ~= 157 and tCoolID[i] ~= 156 and tCoolID[i] ~= 452 and tCoolID[i] ~= 493 and tCoolID[i] ~= 565 then  --�������ڹ��л����ֻؾ�
			target.ClearCDTime(tCoolID[i])
		end
	end
	
	--��һ���ֹ����Ѿ���skill.lh��ע�͵��ˣ��ɳ�����ֱ������
--[[
	local SkillCDTable = {
		[10003] = {257, 261, 258, 236, 252, 260},
		[10002] = {257, 261, 258, 236, 252, 260},
		[10021] = {132, 100, 136, 182, 2645, 14965, 228, 141, 14639},
		[10028] = {132, 100, 136, 141, 2663, 14963, 140, 14664},
		[10026] = {413, 412, 433, 418, 2628, 15158, 423, 425},
		[10062] = {413, 412, 433, 418, 2628, 15115, 423, 425},
		[10175] = {3702, 2226, 2227, 2218, 15121, 2216, 2228, 2212, 2215, 2214},
		[10225] = {3103, 3114, 3094, 3112, 3090, 3089},
		[10224] = {3103, 3114, 3094, 3112, 3090, 3089},
		[10144] = {1589, 1656, 1668, 1649, 1645, 1663, 1596},
		[10145] = {1589, 1656, 1668, 1649, 1645, 1663, 1596},
		[10242] = {3973, 3974, 3975, 3978, 3968, 3977, 3969, 3970},
		[10014] = {371, 6911, 355, 2681, 313, 370, 305, 2674},
		[10015] = {372, 355, 2681, 313, 366, 310, 2690},
		[10080] = {557, 569, 555, 550, 574, 568},
		[10081] = {557, 558, 573, 550, 574, 568, 544},
		[10176] = {3702, 2226, 2957, 2230, 2235, 6688, 2228, 2216},
		[10243] = {3973, 3981, 3985, 3984, 3968, 3971, 3969, 3970, 3980},
		[10390] = {13067, 13042, 13070, 15196, 13040, 13072, 13049, 13424},
		[10447] = {14082, 14232, 14081, 14076, 14074, 14075},
		[10448] = {14082, 14073, 14081, 14076, 14074, 14075}
	}

	local targetKungfuID = nil
	if target.GetKungfuMount() ~= nil then
		targetKungfuID = target.GetKungfuMount().dwSkillID
	end

	for k, v in pairs(SkillCDTable) do
		if k == targetKungfuID then
			for _, SkillID in pairs(v) do
				if target.GetBuff(9322, 1) then
					if SkillID == 14074 then
						ModityCDToUI(target, SkillID, 14223, 0)
					elseif SkillID == 14075 then
						ModityCDToUI(target, SkillID, 14224, 0)
					else
						ModityCDToUI(target, SkillID, 0, 0)
					end
				else
					ModityCDToUI(target, SkillID, 0, 0)
				end
			end
		end
	end
--]]
	if target.IsDueling(dwSkillSrcID) == 0 and target.dwFirstAttackPlayer == 0 then
		--print(666)
		target.dwFirstAttackPlayer = dwSkillSrcID
	end

	player.BeginControlPlayer(target.dwID)

	--ֹͣ����е�Ŀ�꣬��ֹ�߶��쳣ˤ��
	if target.nMoveState == MOVE_STATE.ON_DASH then
		target.Stop()
	end

	--ModityCDToUI(target, 257, 0, 0)

	--[[
	player.AddBuff(target.dwID, target.nLevel, 10173, 1)
	target.AddBuff(target.dwID, target.nLevel, 10174, 1)
	--]]
	if target.GetBuff(10471, 1) then
		player.AddBuff(target.dwID, target.nLevel, 10173, 1, 6)
		target.AddBuff(target.dwID, target.nLevel, 10174, 1, 6)
		local nbuff = target.GetBuff(10174, 1)
		if nbuff then
			nbuff.nCustomValue = 2
		end
	else
		--print(111111)
		player.AddBuff(target.dwID, target.nLevel, 10173, 1, 12)
		target.AddBuff(target.dwID, target.nLevel, 10174, 1, 12)
		local nbuff = target.GetBuff(10174, 1)
		if nbuff then
			nbuff.nCustomValue = 1
		end
	end

	local nbuff = player.GetBuff(10173, 1)
	if nbuff then
		nbuff.nCustomValue = target.nCurrentMana

		ModityCDToUI(player, 14232, 0, 0)
	end

	--[[
	--����Ŀ�����������Ŀ��CD
	for i = 1, #tCoolID do	--���CD
		if tCoolID[i] ~= 152 and tCoolID[i] ~= 153 and tCoolID[i] ~= 155 and tCoolID[i] ~= 154 and tCoolID[i] ~= 157 and tCoolID[i] ~= 156 and tCoolID[i] ~= 452 and tCoolID[i] ~= 493 and tCoolID[i] ~= 565 then  --�������ڹ��л�
			target.ClearCDTime(tCoolID[i])
		end
	end
	--��¼CD
	player.BackupCoolDown()

	--�ظ�CD
	player.RestoreCoolDown()
	--]]
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/��/��_��Ѩ����_����ָ�����˺�.lua
-- ����ʱ��:	2015/9/27 21:25:16
-- �����û�:	mengxiangfei11
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 38, nDamageRand = 5, }, -- Level 1
	{nAddRage = 0, nCostRage = 10, nDamageBase = 44, nDamageRand = 5, }, -- Level 2
	{nAddRage = 0, nCostRage = 10, nDamageBase = 49, nDamageRand = 5, }, -- Level 3
	{nAddRage = 0, nCostRage = 10, nDamageBase = 54, nDamageRand = 5, }, -- Level 4
	{nAddRage = 0, nCostRage = 10, nDamageBase = 59, nDamageRand = 5, }, -- Level 5
	{nAddRage = 0, nCostRage = 10, nDamageBase = 63, nDamageRand = 5, }, -- Level 6
	{nAddRage = 0, nCostRage = 10, nDamageBase = 69, nDamageRand = 5, }, -- Level 7
	{nAddRage = 0, nCostRage = 10, nDamageBase = 71, nDamageRand = 5, }, -- Level 8
	{nAddRage = 0, nCostRage = 10, nDamageBase = 73, nDamageRand = 5, }, -- Level 9
	{nAddRage = 0, nCostRage = 10, nDamageBase = 75, nDamageRand = 10, }, -- Level 10
	{nAddRage = 0, nCostRage = 10, nDamageBase = 77, nDamageRand = 11, }, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 79, nDamageRand = 12, }, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 81, nDamageRand = 13, }, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 83, nDamageRand = 14, }, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 85, nDamageRand = 15, }, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 86, nDamageRand = 16, }, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 90, nDamageRand = 17, }, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 94, nDamageRand = 18, }, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 98, nDamageRand = 19, }, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 102, nDamageRand = 20, }, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 105, nDamageRand = 21, }, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 110, nDamageRand = 22, }, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 115, nDamageRand = 23, }, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 120, nDamageRand = 24, }, -- Level 24
	{nAddRage = 0, nCostRage = 10, nDamageBase = 125, nDamageRand = 25, }, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 135, nDamageRand = 26, }, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 145, nDamageRand = 27, }, -- Level 27
	{nAddRage = 0, nCostRage = 10, nDamageBase = 155, nDamageRand = 28, }, -- Level 28
};

tPit =
{
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
}

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE, -- ħ������
		tSkillData[dwSkillLevel].nDamageBase * (1 - tPit[dwSkillLevel].nReducePercent), -- ����ֵ1
		0																-- ����ֵ2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE_RAND, -- ħ������
		tSkillData[dwSkillLevel].nDamageRand * (1 - tPit[dwSkillLevel].nReducePercent), -- ����ֵ1
		0																-- ����ֵ2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CALL_NEUTRAL_DAMAGE, -- ħ������
		0, -- ����ֵ1
		0																-- ����ֵ2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ����AP�ӳ�
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1116,
		1
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL, -- ħ������
		2726, -- ����ֵ1
		1																	-- ����ֵ2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/��/��_��Ѩ����_����ָ�����˺�.lua",
		0
	);
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff

	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);			-- ����Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- ����Hot

	----------------- ����Cool down --------------------------------------------
	--CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetPublicCoolDown(16);						-- ����CD 1.5��
	--skill.SetNormalCoolDown(1, 175);
	--skill.SetCheckCoolDown(1, 444)
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
	--skill.nCostRage		= 0;									-- �������ĵ�ŭ��
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
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 25 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	--skill.nMinPrepareFrames = 1;
	--skill.nPrepareFrames = 28;				-- ����֡��  09��6��27��Ϊ32 ����CBG
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 48 * 1.365*1.2;
	elseif dwSkillLevel < 28 then
		skill.nChannelInterval = (48 + (dwSkillLevel - 9) * 4) * 1.365*1.2
	else
		skill.nChannelInterval = 130 * 1.365*1.2;     -- ͨ�������ʱ��
	end

	--skill.nChannelInterval = 130; 				-- ͨ�������ʱ��
	--skill.nMinChannelInterval = 1;
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nBulletVelocity		= 85;				-- �ӵ��ٶȣ���λ ��/֡

	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���

	----------------- Ŀ��Ѫ������ ---------------------------------------------
	--skill.bIsFormationSkill		= 0;			-- Ѫ����Сֵ>=
	--skill.TargetLifePercentMax	= 100;			-- Ѫ�����ֵ<=

	----------------- ������ -------------------------------------------------
	skill.nBrokenRate = PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024

	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
end

function OnSkillLevelUp(skill, player)
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

	--�������Ҳ���õ�
	local lv_shangyang = player.GetSkillLevel(180)
	local lv_lancui = player.GetSkillLevel(190)
	local lv1 = player.GetSkillLevel(189)
	local nSkill = player.GetKungfuMount()

	--���������������dotЧ��
	local buff_luansa = player.GetBuff(2719, 1)
	if buff_luansa then
		local nValue = buff_luansa.nCustomValue
		if nValue == 0 then
			if lv_lancui ~= 0 then
				--��������
				player.CastSkill(13848, lv_lancui, player.GetSkillTarget())
			end
			if lv1 ~= 0 then
				--��������
				player.CastSkill(13847, lv1, player.GetSkillTarget())
			end
			if lv_shangyang ~= 0 then
				--��������
				--player.CastSkill(13849, lv_shangyang, player.GetSkillTarget())
			end
		end
		buff_luansa.nCustomValue = buff_luansa.nCustomValue + 1
		if player.GetBuff(2719, 1) then
			player.DelBuff(2719,1)
		end
	end

	--����������������
	if player.GetSkillLevel(5773) == 1 and lv1 ~= 0 then
		if not player.GetBuff(5697, 1) and (not buff_luansa or (buff_luansa and buff_luansa.nCustomValue > 1)) then --����
			player.CastSkill(3037, lv1, player.GetSkillTarget())
		end
	end

	--����ָ����ܽ�ز���CD
	player.CastSkill(1121, 1)

	--��ħЧ��������ָ����ѩ�˺����
	if player.GetSkillLevel(9464) == 1 and nSkill ~= nil and nSkill.dwSkillID == 10021 then
		player.AddBuff(player.dwID, player.nLevel, 8085, 1)
		local nbuffcount = player.GetBuff(8085, 1).nStackNum
		if nbuffcount >= 5 then
			player.DelGroupBuff(8085, 1)
			--��ͼ��buff
			if player.GetSkillLevel(5762) == 1 then
				--��Ϊ�����ѩ
				player.AddBuff(player.dwID, player.nLevel, 8086, 1)
			else
				--��ΪȺ���ѩ
				player.AddBuff(player.dwID, player.nLevel, 8087, 1)
			end
		end
	end

	--�θ�����ָ������
	if player.GetSkillLevel(5764) == 1 then
		player.AddBuff(player.dwID, player.nLevel, 6251, 1)
	end


	target.AddBuff(dwSkillSrcID, player.nLevel, 5698, 1, 1)
	local lv2 = player.GetSkillLevel(179)
	local t1, t2, t3, t4, t5, t6
	t1 = 0
	t2 = 0
	t3 = 0
	t4 = 0
	t5 = 0
	t6 = 0
	player.CastSkill(6126, 1, player.GetSkillTarget())
	if player.GetBuff(5850, 1) then
		t1 = 1
	end
	if not t1 == 1 then
		player.CastSkill(6127, 1, player.GetSkillTarget())
		if player.GetBuff(5850, 1) then
			t2 = 1
		end
	end
	player.CastSkill(6128, 1, player.GetSkillTarget())
	if player.GetBuff(5851, 1) then
		t3 = 1
	end
	player.CastSkill(6129, 1, player.GetSkillTarget())
	if player.GetBuff(5852, 1) then
		t4 = 1
	end
	if not t4 == 1 then
		player.CastSkill(6130, 1, player.GetSkillTarget())
		if player.GetBuff(5852, 1) then
			t5 = 1
		end
	end
	if (not t4 == 1) and (not t5 == 1) then
		player.CastSkill(6131, 1, player.GetSkillTarget())
		if player.GetBuff(5852, 1) then
			t6 = 1
		end
	end
	local sum = t1 + t2 + t3 + t4 + t5 + t6

	--����ָ��������������˺�Ч����Ŀ�꽦������˺�Ч��
	if player.GetSkillLevel(5774) == 1 then
		--��������
		--print(11111)
		if target.GetBuffByOwner(666, lv_shangyang, player.dwID) then
			--print(22222)
			--target.AddBuff(player.dwID, player.nLevel, 9725, 1)	--��ˢ�µ�ǰĿ��
			--print(player.CastSkill(14647, lv_shangyang, player.GetSkillTarget()))
			player.CastSkillXYZ(14647, lv_shangyang, target.nX, target.nY, target.nZ + 948)
		end

		--��������
		if target.GetBuffByOwner(711, lv_lancui, player.dwID) then
			--target.AddBuff(player.dwID, player.nLevel, 9726, 1)	--��ˢ�µ�ǰĿ��
			--player.CastSkill(14648, lv_lancui, player.GetSkillTarget())
			player.CastSkillXYZ(14648, lv_lancui, target.nX, target.nY, target.nZ + 948)
		end

		--��������
		if target.GetBuffByOwner(714, lv1, player.dwID) then
			--target.AddBuff(player.dwID, player.nLevel, 9727, 1)	--��ˢ�µ�ǰĿ��
			--player.CastSkill(14649, lv1, player.GetSkillTarget())
			player.CastSkillXYZ(14649, lv1, target.nX, target.nY, target.nZ + 948)
		end
	end

	--����������ѨЧ��
	local lv = 0
	if t1 == 1 or t2 == 1 then
		lv = lv + 1
	end
	if t3 == 1 then
		lv = lv + 1
	end
	if t4 == 1 or t5 == 1 or t6 == 1 then
		lv = lv + 1
	end

	local i
	--[[
	if player.GetSkillLevel(5767) == 1 then
		for i = 1, sum do
			player.AddBuff(player.dwID, player.nLevel, 6255, 1, 1)
		end
	end
	--]]
	if player.GetSkillLevel(9477) == 1 then
		if player.GetBuff(8102, 1) then
			local nbuffnum = player.GetBuff(8102, 1).nStackNum
			player.CastSkill(9478, nbuffnum)
			player.DelGroupBuff(8102, 1)
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
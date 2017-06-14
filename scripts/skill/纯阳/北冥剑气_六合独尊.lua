---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��ڤ����_���϶���.lua
-- ����ʱ��:	2015/10/14 21:35:08
-- �����û�:	mengxiangfei11
-- �ű�˵��:
----------------------------------------------------------------------<
---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��ڤ����_���϶���.lua
-- ����ʱ��:	2013/5/8 17:23:44
-- �����û�:	taoli
-- �ű�˵��:

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 0, nDamageBase = 110, nDamageRand = 4}, -- Level 1
	{nAddRage = 0, nCostRage = 0, nDamageBase = 170, nDamageRand = 7}, -- Level 2
	{nAddRage = 0, nCostRage = 0, nDamageBase = 240, nDamageRand = 10}, -- Level 3
	{nAddRage = 0, nCostRage = 0, nDamageBase = 270, nDamageRand = 14}, -- Level 4
	{nAddRage = 0, nCostRage = 0, nDamageBase = 310, nDamageRand = 17}, -- Level 5
	{nAddRage = 0, nCostRage = 0, nDamageBase = 370, nDamageRand = 20}, -- Level 6
	{nAddRage = 0, nCostRage = 0, nDamageBase = 400, nDamageRand = 24}, -- Level 7
	{nAddRage = 0, nCostRage = 0, nDamageBase = 420, nDamageRand = 27}, -- Level 8
	{nAddRage = 0, nCostRage = 0, nDamageBase = 440, nDamageRand = 30}, -- Level 9
	{nAddRage = 0, nCostRage = 0, nDamageBase = 460, nDamageRand = 34}, -- Level 10
	{nAddRage = 0, nCostRage = 0, nDamageBase = 480, nDamageRand = 37}, -- Level 11
	{nAddRage = 0, nCostRage = 0, nDamageBase = 500, nDamageRand = 40}, -- Level 12
	{nAddRage = 0, nCostRage = 0, nDamageBase = 520, nDamageRand = 44}, -- Level 13
	{nAddRage = 0, nCostRage = 0, nDamageBase = 540, nDamageRand = 47}, -- Level 14
	{nAddRage = 0, nCostRage = 0, nDamageBase = 560, nDamageRand = 50}, -- Level 15
	{nAddRage = 0, nCostRage = 0, nDamageBase = 580, nDamageRand = 54}, -- Level 16
	{nAddRage = 0, nCostRage = 0, nDamageBase = 600, nDamageRand = 57}, -- Level 17
	{nAddRage = 0, nCostRage = 0, nDamageBase = 620, nDamageRand = 60}, -- Level 18
	{nAddRage = 0, nCostRage = 0, nDamageBase = 640, nDamageRand = 64}, -- Level 19
	{nAddRage = 0, nCostRage = 0, nDamageBase = 670, nDamageRand = 67}, -- Level 20
	{nAddRage = 0, nCostRage = 0, nDamageBase = 703, nDamageRand = 71}, -- Level 21
	{nAddRage = 0, nCostRage = 0, nDamageBase = 737, nDamageRand = 74}, -- Level 22
	{nAddRage = 0, nCostRage = 0, nDamageBase = 770, nDamageRand = 77}, -- Level 23
	{nAddRage = 0, nCostRage = 0, nDamageBase = 804, nDamageRand = 81}, -- Level 24
	{nAddRage = 0, nCostRage = 0, nDamageBase = 837, nDamageRand = 84}, -- Level 25
	{nAddRage = 0, nCostRage = 0, nDamageBase = 871, nDamageRand = 87}, -- Level 26
	{nAddRage = 0, nCostRage = 0, nDamageBase = 904, nDamageRand = 91}, -- Level 27
	{nAddRage = 0, nCostRage = 0, nDamageBase = 938, nDamageRand = 94}, -- Level 28
	{nAddRage = 0, nCostRage = 0, nDamageBase = 971, nDamageRand = 97}, -- Level 29
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1005, nDamageRand = 101}, -- Level 30
	{nAddRage = 0, nCostRage = 0, nDamageBase = 1038, nDamageRand = 104}, -- Level 31
};

--�����书���ܼ��������ֵvxx
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE, -- ħ������
		tSkillData[dwSkillLevel].nDamageBase / 10, -- ����ֵ1
		0																-- ����ֵ2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE, -- ħ������
		tSkillData[dwSkillLevel].nDamageRand, -- ����ֵ1
		0																-- ����ֵ2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CALL_NEUTRAL_DAMAGE, -- ħ������
		0, -- ����ֵ1
		0																-- ����ֵ2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/��ڤ����_���϶���.lua", -- ��Э��
		0
		);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		15209, -- ��Э��
		dwSkillLevel
		);	
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff

	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);			-- ����Buff
	--skill.BindBuff(1, 555, 1);						-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- ����Hot

	----------------- ����Cool down --------------------------------------------
	--CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetPublicCoolDown(16);
	skill.SetCheckCoolDown(1, 444);

	----------------- ����������� ---------------------------------------------
	--skill.bIgnorePrepareState = true	--�����Ƿ����������ʩ�ţ�������ͨ����������������true
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;					-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;					-- �������ĵ�����
	--skill.nCostRage		= 0;					-- �������ĵ�ŭ��
	--skill.nCostStamina	= 0;					-- �������ĵ�����
	--skill.nCostItemType	= 0;					-- �������ĵ���Ʒ����
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 708 * 0.2;	-- �������ĵ�����
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 708 * 0.4;	-- �������ĵ�����
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 708 * 0.6;	-- �������ĵ�����
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 708 * 0.8;	-- �������ĵ�����
	else
		skill.nCostManaBasePercent = 708;	-- �������ĵ�����
	end

	----------------- ������� -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)

	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨

	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0;					-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 15 * LENGTH_BASE;					-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	skill.nAreaRadius = 6 * LENGTH_BASE;		-- �������ð뾶
	skill.nTargetCountLimit = 6;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	skill.nMinChannelInterval = 1;-- ͨ�������ʱ��
	skill.nChannelInterval = 16; 				-- ͨ�������ʱ��
	skill.nChannelFrame = 16 * 5;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡

	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���

	----------------- ������ -------------------------------------------------
	skill.nBrokenRate = PERCENT_BASE;		-- ���ܱ���ϵĸ���.����1024
	--skill.nBreakRate			= PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024

	----------------- �����˺���� ---------------------------------------------
	--nWeaponDamagePercent		= 0;				-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	for i = 1, 4 do
		if player.GetBuff(9965, i) then
			player.DelBuff(9965, i)
		end

		if player.GetBuff(9966, i) then
			player.DelBuff(9966, i)
		end
	end

	return nPreResult;
end

function OnSkillLevelUp(skill, player)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	local buff
	if player.GetSkillLevel(5826) == 1 then
		--�ظ������
		player.CastSkill(14996, 1)
		target.AddBuff(dwSkillSrcID, player.nLevel, 5655, 1, 1)
		buff = target.GetBuff(5655, 1)
		if not buff then
			return
		end
		if buff.nStackNum == 3 then
			target.AddBuff(dwSkillSrcID, player.nLevel, 749, 1, 1)
			target.DelBuff(5655, 1)
			target.DelBuff(5655, 1)
			target.DelBuff(5655, 1)
		end
	end

	if player.GetSkillLevel(5819) == 1 then
		if player.GetBuff(9966, 3) then
			player.AddBuff(player.dwID, player.nLevel, 9965, 4)
		elseif player.GetBuff(9966, 2) then
			player.AddBuff(player.dwID, player.nLevel, 9965, 3)
		elseif player.GetBuff(9966, 1) then
			player.AddBuff(player.dwID, player.nLevel, 9965, 2)
		else
			player.AddBuff(player.dwID, player.nLevel, 9965, 1)
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
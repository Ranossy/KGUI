---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�嶾/�嶾_����ͼ¼_����˲���˺�.lua
-- ����ʱ��:	2017/3/17 11:24:42
-- �����û�:	XIAXIANBO1
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- ������   :  CBG
-- ����ʱ��	:  2010-11-19
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 85 * 0.85, nDamageRand = 16 * 0.1, }, -- Level 1
	{nAddRage = 0, nCostRage = 10, nDamageBase = 90 * 0.85, nDamageRand = 22 * 0.1, }, -- Level 2
	{nAddRage = 0, nCostRage = 10, nDamageBase = 95 * 0.85, nDamageRand = 29 * 0.1, }, -- Level 3
	{nAddRage = 0, nCostRage = 10, nDamageBase = 100 * 0.85, nDamageRand = 35 * 0.1, }, -- Level 4
	{nAddRage = 0, nCostRage = 10, nDamageBase = 105 * 0.85, nDamageRand = 42 * 0.1, }, -- Level 5
	{nAddRage = 0, nCostRage = 10, nDamageBase = 110 * 0.85, nDamageRand = 48 * 0.1, }, -- Level 6
	{nAddRage = 0, nCostRage = 10, nDamageBase = 115 * 0.85, nDamageRand = 55 * 0.1, }, -- Level 7
	{nAddRage = 0, nCostRage = 10, nDamageBase = 120 * 0.85, nDamageRand = 61 * 0.1, }, -- Level 8
	{nAddRage = 0, nCostRage = 10, nDamageBase = 125 * 0.85, nDamageRand = 68 * 0.1, }, -- Level 9
	{nAddRage = 0, nCostRage = 10, nDamageBase = 130 * 0.85, nDamageRand = 74 * 0.1, }, -- Level 10
	{nAddRage = 0, nCostRage = 10, nDamageBase = 135 * 0.85, nDamageRand = 81 * 0.1, }, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 140 * 0.85, nDamageRand = 87 * 0.1, }, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 145 * 0.85, nDamageRand = 94 * 0.1, }, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 150 * 0.85, nDamageRand = 100 * 0.1, }, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 155 * 0.85, nDamageRand = 107 * 0.1, }, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 160 * 0.85, nDamageRand = 113 * 0.1, }, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 165 * 0.85, nDamageRand = 120 * 0.1, }, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 170 * 0.85, nDamageRand = 126 * 0.1, }, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 175 * 0.85, nDamageRand = 133 * 0.1, }, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 180 * 0.85, nDamageRand = 139 * 0.1, }, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 185 * 0.85, nDamageRand = 146 * 0.1, }, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 190 * 0.85, nDamageRand = 152 * 0.1, }, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 195 * 0.85, nDamageRand = 159 * 0.1, }, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 200 * 0.85, nDamageRand = 165 * 0.1, }, -- Level 24
	{nAddRage = 0, nCostRage = 10, nDamageBase = 205 * 0.85, nDamageRand = 172 * 0.1, }, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 210 * 0.85, nDamageRand = 178 * 0.1, }, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 215 * 0.85, nDamageRand = 185 * 0.1, }, -- Level 27
	{nAddRage = 0, nCostRage = 10, nDamageBase = 220 * 0.85, nDamageRand = 191 * 0.1, }, -- Level 28
	{nAddRage = 0, nCostRage = 10, nDamageBase = 225 * 0.85, nDamageRand = 198 * 0.1, }, -- Level 29
	{nAddRage = 0, nCostRage = 10, nDamageBase = 230 * 0.85, nDamageRand = 204 * 0.1, }, -- Level 30
	{nAddRage = 0, nCostRage = 10, nDamageBase = 235 * 0.85, nDamageRand = 211 * 0.1, }, -- Level 31
	{nAddRage = 0, nCostRage = 10, nDamageBase = 240 * 0.85, nDamageRand = 217 * 0.1, }, -- Level 32
	{nAddRage = 0, nCostRage = 10, nDamageBase = 245 * 0.85, nDamageRand = 224 * 0.1, }, -- Level 33
	{nAddRage = 0, nCostRage = 10, nDamageBase = 250 * 0.85, nDamageRand = 230 * 0.1, }, -- Level 34
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
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/�嶾/�嶾_����ͼ¼_����˲���˺�.lua",
		0
	);
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(2315, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);	-- Ů洲��첻����
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff

	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, 2509, dwSkillLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	--skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetNormalCoolDown(1, 400);
	--skill.SetCheckCoolDown(1, 444);

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
	skill.nMaxRadius = 20 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	skill.nAreaRadius = 6 * LENGTH_BASE;		-- �������ð뾶
	skill.nTargetCountLimit = 5;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 24;				-- ����֡��
	skill.nChannelInterval = 216 * 1.15 * 1.1; 				-- ͨ�������ʱ��
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

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	print(1111)
	if player.GetBuff(10180, 1)then
		player.DelBuff(10180, 1)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
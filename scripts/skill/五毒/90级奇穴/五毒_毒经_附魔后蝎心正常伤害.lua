---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�嶾/90����Ѩ/�嶾_����_��ħ��Ы�������˺�.lua
-- ����ʱ��:	2014/7/2 11:05:10
-- �����û�:	mengxiangfei
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
	{nAddRage = 0, nCostRage = 10, nDamageBase = 65, nDamageRand = 51 / 3 * 0.1, }, -- Level 1
	{nAddRage = 0, nCostRage = 10, nDamageBase = 72, nDamageRand = 66 / 3 * 0.1, }, -- Level 2
	{nAddRage = 0, nCostRage = 10, nDamageBase = 77, nDamageRand = 80 / 3 * 0.1, }, -- Level 3
	{nAddRage = 0, nCostRage = 10, nDamageBase = 81, nDamageRand = 95 / 3 * 0.1, }, -- Level 4
	{nAddRage = 0, nCostRage = 10, nDamageBase = 88, nDamageRand = 109 / 3 * 0.1, }, -- Level 5
	{nAddRage = 0, nCostRage = 10, nDamageBase = 94, nDamageRand = 124 / 3 * 0.1, }, -- Level 6
	{nAddRage = 0, nCostRage = 10, nDamageBase = 97, nDamageRand = 139 / 3 * 0.1, }, -- Level 7
	{nAddRage = 0, nCostRage = 10, nDamageBase = 100, nDamageRand = 153 / 3 * 0.1, }, -- Level 8
	{nAddRage = 0, nCostRage = 10, nDamageBase = 103, nDamageRand = 168 / 3 * 0.1, }, -- Level 9
	{nAddRage = 0, nCostRage = 10, nDamageBase = 106, nDamageRand = 182 / 3 * 0.1, }, -- Level 10
	{nAddRage = 0, nCostRage = 10, nDamageBase = 109, nDamageRand = 197 / 3 * 0.1, }, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 112, nDamageRand = 212 / 3 * 0.1, }, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 115, nDamageRand = 226 / 3 * 0.1, }, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 118, nDamageRand = 241 / 3 * 0.1, }, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 121, nDamageRand = 255 / 3 * 0.1, }, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 124, nDamageRand = 270 / 3 * 0.1, }, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 127, nDamageRand = 285 / 3 * 0.1, }, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 130, nDamageRand = 299 / 3 * 0.1, }, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 133, nDamageRand = 314 / 3 * 0.1, }, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 137, nDamageRand = 328 / 3 * 0.1, }, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 140, nDamageRand = 343 / 3 * 0.1, }, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 143, nDamageRand = 358 / 3 * 0.1, }, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 146, nDamageRand = 372 / 3 * 0.1, }, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 149, nDamageRand = 387 / 3 * 0.1, }, -- Level 24
	{nAddRage = 0, nCostRage = 10, nDamageBase = 152, nDamageRand = 401 / 3 * 0.1, }, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 155, nDamageRand = 416 / 3 * 0.1, }, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 158, nDamageRand = 431 / 3 * 0.1, }, -- Level 27
	{nAddRage = 0, nCostRage = 10, nDamageBase = 161, nDamageRand = 445 / 3 * 0.1, }, -- Level 28
	{nAddRage = 0, nCostRage = 10, nDamageBase = 164, nDamageRand = 460 / 3 * 0.1, }, -- Level 29
	{nAddRage = 0, nCostRage = 10, nDamageBase = 167, nDamageRand = 474 / 3 * 0.1, }, -- Level 30
	{nAddRage = 0, nCostRage = 10, nDamageBase = 170, nDamageRand = 489 / 3 * 0.1, }, -- Level 31
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
	--[[
	skill.AddAttribute(													-- �����ƴ���
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST, -- ħ������
		2455, --����ֵ1
		dwSkillLevel										--����ֵ2
	);

	skill.AddAttribute(													-- ���Ĺƴ���
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST, -- ħ������
		2460, --����ֵ1
		dwSkillLevel										--����ֵ2
	);

	skill.AddAttribute(													-- �ݲйƴ���
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST, -- ħ������
		2465, --����ֵ1
		dwSkillLevel										--����ֵ2
	);
	skill.AddAttribute(													-- �嶾�����󷨵�����Ч��
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CAST_SKILL, -- ħ������
		2490, --����ֵ1
		1										--����ֵ2
	);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_GROUP_BUFF_BY_ID_AND_LEVEL,
		6226,
		1
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/�嶾/�嶾_����ͼ¼_Ы��.lua",
		0
	);

	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(2315, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);	-- Ů洲��첻����
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
	---------------------------------------------------------------
	skill.AddCheckSelfLearntSkill(9330, 0, SKILL_COMPARE_FLAG.EQUAL);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�

	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	--skill.SetPublicCoolDown(16);
	--skill.SetCheckCoolDown(1, 444);						-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);

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
	--skill.nCostManaBasePercent = 269;	-- �������ĵ�����
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
	--skill.nPrepareFrames = 28;				-- ����֡��
	--skill.nMinPrepareFrames = 1;
	skill.nChannelInterval = (104+28)*1.3*1.1; 				-- ͨ�������ʱ��
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
	--[[
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(1743)
	end
	--]]
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)

end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
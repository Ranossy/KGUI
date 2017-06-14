---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����_����ն.lua
-- ����ʱ��:	2014/10/28 23:23:48
-- �����û�:	mengxiangfei
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- ������   :  ֣����
-- ����ʱ��	:  20120613
-- Ч����ע	:  ���̼���
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 73 * 0.95, nDamageRand = 73 * 0.1, nCostMana = 0}, --level 1
	{nDamageBase = 93 * 0.95, nDamageRand = 93 * 0.1, nCostMana = 0}, --level 2
	{nDamageBase = 113 * 0.95, nDamageRand = 113 * 0.1, nCostMana = 0}, --level 3
	{nDamageBase = 133 * 0.95, nDamageRand = 133 * 0.1, nCostMana = 0}, --level 4
	{nDamageBase = 153 * 0.95, nDamageRand = 153 * 0.1, nCostMana = 0}, --level 5
	{nDamageBase = 173 * 0.95, nDamageRand = 173 * 0.1, nCostMana = 0}, --level 6
	{nDamageBase = 193 * 0.95, nDamageRand = 193 * 0.1, nCostMana = 0}, --level 7
	{nDamageBase = 213 * 0.95, nDamageRand = 213 * 0.1, nCostMana = 0}, --level 8
	{nDamageBase = 233 * 0.95, nDamageRand = 233 * 0.1, nCostMana = 0}, --level 9
	{nDamageBase = 253 * 0.95, nDamageRand = 253 * 0.1, nCostMana = 0}, --level 1
	{nDamageBase = 273 * 0.95, nDamageRand = 273 * 0.1, nCostMana = 0}, --level 2
	{nDamageBase = 293 * 0.95, nDamageRand = 293 * 0.1, nCostMana = 0}, --level 3
	{nDamageBase = 313 * 0.95, nDamageRand = 313 * 0.1, nCostMana = 0}, --level 4
	{nDamageBase = 333 * 0.95, nDamageRand = 333 * 0.1, nCostMana = 0}, --level 5
	{nDamageBase = 353 * 0.95, nDamageRand = 353 * 0.1, nCostMana = 0}, --level 6
	{nDamageBase = 373 * 0.95, nDamageRand = 373 * 0.1, nCostMana = 0}, --level 7
	{nDamageBase = 393 * 0.95, nDamageRand = 393 * 0.1, nCostMana = 0}, --level 8
	{nDamageBase = 413 * 0.95, nDamageRand = 413 * 0.1, nCostMana = 0}, --level 9

};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		13468,
		dwSkillLevel
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		13359,
		dwSkillLevel
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CURRENT_MOON_ENERGY,
		4000,
		0
	);

	--�������ͨ��
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/����ͨ��ɾbuff.lua",
		0
	);
	----------------- ����ʩ��Buff���� ---------------------------------------------
	skill.AddSlowCheckSelfBuff(6279, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- �������������Լ���Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- ����Ŀ�������Լ���Buff

	-----------------����ʩ�ż�������-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, 4202, dwSkillLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	skill.SetPublicCoolDown(503);		-- ���̹���CD 1��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetNormalCoolDown(1, 505);	--������ͨCD
	skill.SetCheckCoolDown(1, 444);	--��������CD
	--skill.SetCheckCoolDown(CoolDownIndex, nCoolDownID);	--ֻ��鲻�ߵ�CD
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- ���ܳ�� -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- �������� ---------------da----------------------------------
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
	skill.nMaxRadius = 8 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	skill.nAngleRange = 128;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��

	if dwSkillLevel < 10 then
		skill.nChannelInterval = 40 * 1.1 * 1.1;
	elseif dwSkillLevel < 32 then
		skill.nChannelInterval = (40 + (dwSkillLevel - 9) * 4) * 1.1 * 1.1
	else
		skill.nChannelInterval = 128 * 1.1 * 1.1;     -- ͨ�������ʱ��
	end
	--skill.nChannelInterval	= 160; 				-- ͨ�������ʱ��
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

end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	--[[
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	local nlv = player.GetSkillLevel(3960)
	if nlv ~= 0 then
		player.CastSkill(13359, nlv, player.GetSkillTarget())
	end
	--]]
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
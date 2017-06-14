---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/̫ԭ֮ս_������/����_ʥ��ٳ�.lua
-- ����ʱ��:	2015/3/20 16:26:17
-- �����û�:	guozhaoxing1
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 19600, nDamageRand = 0, nCostMana = 0}, --level 1
	{nDamageBase = 19600 + 9800, nDamageRand = 0, nCostMana = 0}, --level 2
	{nDamageBase = 19600 + 9800 * 2, nDamageRand = 0, nCostMana = 0}, --level 3
	{nDamageBase = 19600 + 9800 * 3, nDamageRand = 0, nCostMana = 0}, --level 4
	{nDamageBase = 19600 + 9800 * 4, nDamageRand = 0, nCostMana = 0}, --level 5
	{nDamageBase = 19600 + 9800 * 5, nDamageRand = 0, nCostMana = 0}, --level 6
	{nDamageBase = 19600 + 9800 * 6 + 49000, nDamageRand = 0, nCostMana = 0}, --level 7
	{nDamageBase = 23000, nDamageRand = 0, nCostMana = 0}, --level 8
	{nDamageBase = 23000 + 11500, nDamageRand = 0, nCostMana = 0}, --level 9
	{nDamageBase = 23000 + 11500 * 2, nDamageRand = 0, nCostMana = 0}, --level 10
	{nDamageBase = 23000 + 11500 * 3, nDamageRand = 0, nCostMana = 0}, --level 11
	{nDamageBase = 23000 + 11500 * 4, nDamageRand = 0, nCostMana = 0}, --level 12
	{nDamageBase = 23000 + 11500 * 5, nDamageRand = 0, nCostMana = 0}, --level 13
	{nDamageBase = 23000 + 11500 * 6 + 69000, nDamageRand = 0, nCostMana = 0}, --level 14
	{nDamageBase = 32800, nDamageRand = 0, nCostMana = 0}, --level 15
	{nDamageBase = 32800 + 19700, nDamageRand = 0, nCostMana = 0}, --level 16
	{nDamageBase = 32800 + 19700 * 2, nDamageRand = 0, nCostMana = 0}, --level 17
	{nDamageBase = 32800 + 19700 * 3, nDamageRand = 0, nCostMana = 0}, --level 18
	{nDamageBase = 32800 + 19700 * 4, nDamageRand = 0, nCostMana = 0}, --level 19
	{nDamageBase = 32800 + 19700 * 5, nDamageRand = 0, nCostMana = 0}, --level 20
	{nDamageBase = 32800 + 19700 * 6 + 98500, nDamageRand = 0, nCostMana = 0}, --level 21
	{nDamageBase = 20700, nDamageRand = 0, nCostMana = 0}, --level 22
	{nDamageBase = 20700 + 10300, nDamageRand = 0, nCostMana = 0}, --level 23
	{nDamageBase = 20700 + 10300 * 2, nDamageRand = 0, nCostMana = 0}, --level 24
	{nDamageBase = 20700 + 10300 * 3, nDamageRand = 0, nCostMana = 0}, --level 25
	{nDamageBase = 20700 + 10300 * 4, nDamageRand = 0, nCostMana = 0}, --level 26
	{nDamageBase = 20700 + 10300 * 5, nDamageRand = 0, nCostMana = 0}, --level 27
	{nDamageBase = 20700 + 10300 * 6 + 51500, nDamageRand = 0, nCostMana = 0}, --level 28
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	if dwSkillLevel == 7 or dwSkillLevel == 14 or dwSkillLevel == 21 or dwSkillLevel == 28 then
		for i = 1, 6 do
			skill.AddAttribute(
				ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
				ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
				360,
				i
			);
		end

		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
			856,
			1
		);

		for i = 1, 6 do
			skill.AddAttribute(
				ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
				ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
				203,
				i
			);
		end

		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_AND_ROLLBACK,
			ATTRIBUTE_TYPE.GLOBAL_BLOCK,
			-2,
			0
		);

		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_AND_ROLLBACK,
			ATTRIBUTE_TYPE.GLOBAL_RESIST_PERCENT,
			-1024,
			0
		);
	end

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/npc/����BOSS/̫ԭ֮ս_������/����_ʥ��ٳ�.lua", -- ����ֵ1
		0														-- ����ֵ2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase * 0.14 ,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand * 0.14 ,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_SOLAR_DAMAGE,
		0,
		0
	);

	----------------- ħ������ -------------------------------------------------
	--[[
   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.nAttributeEffectMode,					-- ��������ģʽ
   		ATTRIBUTE_TYPE.nAttributeKey,								-- ħ������
   		nAttributeValue1,											-- ����ֵ1
   		nAttributeValue2											-- ����ֵ2
   		);
    --]]

	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- �������������Լ���Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- ����Ŀ�������Լ���Buff

	-----------------����ʩ�ż�������-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�

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
	--skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	--������ͨCD
	--skill.SetCheckCoolDown(CoolDownIndex, nCoolDownID);	--ֻ��鲻�ߵ�CD
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
	skill.nMaxRadius = 100 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	skill.nAreaRadius = 50 * LENGTH_BASE;		-- �������ð뾶
	skill.nTargetCountLimit = 30;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	skill.nPrepareFrames = 2 * GLOBAL.GAME_FPS;				-- ����֡��

	skill.nBeatBackRate = 0 * PERCENT_BASE;
	skill.nBrokenRate = 0 * PERCENT_BASE;
	skill.nBreakRate = 0 * PERCENT_BASE;

	skill.nWeaponDamagePercent = 0;

	return true;
end

function CanCast(player, nPreResult)
	return nPreResult;
end

function OnSkillLevelUp(skill, player)

end

function OnSkillForgotten(skill, player)

end

function Apply(dwCharacterID, dwSkillSrcID)
	local playerA = GetPlayer(dwCharacterID)
	if playerA then
		playerA.PlaySfx(1070, playerA.nX, playerA.nY, playerA.nZ + 500)
	end
end

function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
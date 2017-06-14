---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�嶾/�嶾_����ͼ¼_Ы��.lua
-- ����ʱ��:	2014/6/30 21:23:16
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
	{nAddRage = 0, nCostRage = 10, nDamageBase = 51 / 3 * 0.95, nDamageRand = 51 / 3 * 0.1, }, -- Level 1
	{nAddRage = 0, nCostRage = 10, nDamageBase = 66 / 3 * 0.95, nDamageRand = 66 / 3 * 0.1, }, -- Level 2
	{nAddRage = 0, nCostRage = 10, nDamageBase = 80 / 3 * 0.95, nDamageRand = 80 / 3 * 0.1, }, -- Level 3
	{nAddRage = 0, nCostRage = 10, nDamageBase = 95 / 3 * 0.95, nDamageRand = 95 / 3 * 0.1, }, -- Level 4
	{nAddRage = 0, nCostRage = 10, nDamageBase = 109 / 3 * 0.95, nDamageRand = 109 / 3 * 0.1, }, -- Level 5
	{nAddRage = 0, nCostRage = 10, nDamageBase = 124 / 3 * 0.95, nDamageRand = 124 / 3 * 0.1, }, -- Level 6
	{nAddRage = 0, nCostRage = 10, nDamageBase = 139 / 3 * 0.95, nDamageRand = 139 / 3 * 0.1, }, -- Level 7
	{nAddRage = 0, nCostRage = 10, nDamageBase = 153 / 3 * 0.95, nDamageRand = 153 / 3 * 0.1, }, -- Level 8
	{nAddRage = 0, nCostRage = 10, nDamageBase = 168 / 3 * 0.95, nDamageRand = 168 / 3 * 0.1, }, -- Level 9
	{nAddRage = 0, nCostRage = 10, nDamageBase = 182 / 3 * 0.95, nDamageRand = 182 / 3 * 0.1, }, -- Level 10
	{nAddRage = 0, nCostRage = 10, nDamageBase = 197 / 3 * 0.95, nDamageRand = 197 / 3 * 0.1, }, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 212 / 3 * 0.95, nDamageRand = 212 / 3 * 0.1, }, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 226 / 3 * 0.95, nDamageRand = 226 / 3 * 0.1, }, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 241 / 3 * 0.95, nDamageRand = 241 / 3 * 0.1, }, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 255 / 3 * 0.95, nDamageRand = 255 / 3 * 0.1, }, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 270 / 3 * 0.95, nDamageRand = 270 / 3 * 0.1, }, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 285 / 3 * 0.95, nDamageRand = 285 / 3 * 0.1, }, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 299 / 3 * 0.95, nDamageRand = 299 / 3 * 0.1, }, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 314 / 3 * 0.95, nDamageRand = 314 / 3 * 0.1, }, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 328 / 3 * 0.95, nDamageRand = 328 / 3 * 0.1, }, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 343 / 3 * 0.95, nDamageRand = 343 / 3 * 0.1, }, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 358 / 3 * 0.95, nDamageRand = 358 / 3 * 0.1, }, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 372 / 3 * 0.95, nDamageRand = 372 / 3 * 0.1, }, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamageBase = 387 / 3 * 0.95, nDamageRand = 387 / 3 * 0.1, }, -- Level 24
	{nAddRage = 0, nCostRage = 10, nDamageBase = 401 / 3 * 0.95, nDamageRand = 401 / 3 * 0.1, }, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamageBase = 416 / 3 * 0.95, nDamageRand = 416 / 3 * 0.1, }, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamageBase = 431 / 3 * 0.95, nDamageRand = 431 / 3 * 0.1, }, -- Level 27
	{nAddRage = 0, nCostRage = 10, nDamageBase = 445 / 3 * 0.95, nDamageRand = 445 / 3 * 0.1, }, -- Level 28
	{nAddRage = 0, nCostRage = 10, nDamageBase = 460 / 3 * 0.95, nDamageRand = 460 / 3 * 0.1, }, -- Level 29
	{nAddRage = 0, nCostRage = 10, nDamageBase = 474 / 3 * 0.95, nDamageRand = 474 / 3 * 0.1, }, -- Level 30
	{nAddRage = 0, nCostRage = 10, nDamageBase = 489 / 3 * 0.95, nDamageRand = 489 / 3 * 0.1, }, -- Level 31
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------
	--[[
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
	--]]
	skill.AddAttribute(													-- ����Ы���˺�
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST, -- ħ������
		9331, --����ֵ1
		dwSkillLevel										--����ֵ2
	);

	skill.AddAttribute(													-- ����Ы���˺�����Ѫ
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST, -- ħ������
		9332, --����ֵ1
		dwSkillLevel										--����ֵ2
		);
	skill.AddAttribute(													-- ����Ы���˺�
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST, -- ħ������
		9405, --����ֵ1
		dwSkillLevel										--����ֵ2
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
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/�嶾/�嶾_Ы�Ĵ���3��Ч��.lua",
		0
		);
	skill.AddAttribute(													-- �嶾�����󷨵�����Ч��
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CAST_SKILL, -- ħ������
		2490, --����ֵ1
		1										--����ֵ2
	);
	--[[
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
	--]]
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(2315, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);	-- Ů洲��첻����
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff

	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	skill.SetPublicCoolDown(16);
	skill.SetCheckCoolDown(1, 444);						-- ����CD 1.5��
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
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 215*0.2;	-- �������ĵ�����
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 215 * 0.4;	-- �������ĵ�����
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 215 * 0.6;	-- �������ĵ�����
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 215 * 0.8;	-- �������ĵ�����
	else
		skill.nCostManaBasePercent = 215;	-- �������ĵ�����
	end
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
	skill.nPrepareFrames = 28;				-- ����֡��
	skill.nMinPrepareFrames = 1;
	skill.nChannelInterval = 104; 				-- ͨ�������ʱ��
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
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(1743)
	end
	--��������ָ������
	local nQuestIndex = player.GetQuestIndex(13255)
	local nQuestPhase = player.GetQuestPhase(13255)
	if nQuestIndex and nQuestPhase == 1 then
		player.SetQuestValue(nQuestIndex, 1, skill.dwLevel)
	end
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	--��ħЫ�Ķ����˺�
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.GetSkillLevel(9304) == 1 then
		player.CastSkill(9305, 1)	--�ж���ӰB_2296
		player.CastSkill(9305, 2)	--�ж�����B_2509
		player.CastSkill(9305, 3)	--�ж��ЦB_2295
		
		if player.GetBuff(7982, 1) then
			local nCount = player.GetBuff(7982, 1).nStackNum
			player.CastSkill(9306, nCount)
			player.DelGroupBuff(7982,1)
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�嶾/�嶾_����ͼ¼_�Х.lua
-- ����ʱ��:	2015/10/18 20:24:41
-- �����û�:	mengxiangfei11
-- �ű�˵��:

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 300 * 0.95, nDamageRand = 300 * 0.1, nCostMana = 248}, --level 1
	{nDamageBase = 300 * 0.95, nDamageRand = 300 * 0.1, nCostMana = 324}, --level 2
	{nDamageBase = 300 * 0.95, nDamageRand = 300 * 0.1, nCostMana = 400}, --level 3
	{nDamageBase = 300 * 0.95, nDamageRand = 300 * 0.1, nCostMana = 477}, --level 4
	{nDamageBase = 300 * 0.95, nDamageRand = 300 * 0.1, nCostMana = 553}, --level 5
	{nDamageBase = 300 * 0.95, nDamageRand = 300 * 0.1, nCostMana = 630}, --level 6
	{nDamageBase = 300 * 0.95, nDamageRand = 300 * 0.1, nCostMana = 700}, --level 7
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------
--���Ӷ����ڹ�AP�ӳ�2��
	skill.AddAttribute(													-- dot
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST, -- ħ������
		6236, --����ֵ1
		dwSkillLevel										--����ֵ2
	);
	skill.AddAttribute(													-- dot
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/�嶾/�嶾_����ͼ¼_�Х.lua", --����ֵ1
		0										--����ֵ2
	);
	--[[
	skill.AddAttribute(													-- �����ƴ���
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST, -- ħ������
		2456, --����ֵ1
		dwSkillLevel										--����ֵ2
	);

	skill.AddAttribute(													-- ���Ĺƴ���
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST, -- ħ������
		2461, --����ֵ1
		dwSkillLevel										--����ֵ2
	);

	skill.AddAttribute(													-- �ݲйƴ���
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST, -- ħ������
		2466, --����ֵ1
		dwSkillLevel										--����ֵ2
		);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_SINGLE_GROUP_BUFF_BY_ID_AND_LEVEL,
		6226,
		1
	);

	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(2315, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);	-- Ů洲��첻����
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff

	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, 2295, dwSkillLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetNormalCoolDown(1, 385);
	skill.SetCheckCoolDown(1, 444);

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
	if dwSkillLevel <= 5 then
		skill.nCostManaBasePercent = 455 * 0.2;	-- �������ĵ�����
	elseif dwSkillLevel <= 10 then
		skill.nCostManaBasePercent = 455 * 0.4;
	elseif dwSkillLevel <= 15 then
		skill.nCostManaBasePercent = 455 * 0.6;
	elseif dwSkillLevel <= 20 then
		skill.nCostManaBasePercent = 455 * 0.8;
	else
		skill.nCostManaBasePercent = 455;
	end
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
	skill.nAreaRadius = 8 * LENGTH_BASE;		-- �������ð뾶
	skill.nTargetCountLimit = 8;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 32;				-- ����֡��
	skill.nChannelInterval = 216; 				-- ͨ�������ʱ��
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

	local lv1 = player.GetSkillLevel(2210)
	local lv2 = player.GetSkillLevel(6626)
	local nlev = math.max(lv1, lv2)
	
	if nlev ~= 0 then
		--��������
		if target.GetBuff(2307, 1) or target.GetBuff(10118, 1) then
			if IsPlayer(dwCharacterID) then
				player.CastSkill(2456, nlev, TARGET.PLAYER, dwCharacterID)
			else
				player.CastSkill(2456, nlev, TARGET.NPC, dwCharacterID)
			end
			--player.CastSkill(2456, nlev, player.GetSkillTarget())
		end
		--��������
		if target.GetBuff(2308, 1) or target.GetBuff(10118, 1) then
			if IsPlayer(dwCharacterID) then
				player.CastSkill(2461, nlev, TARGET.PLAYER, dwCharacterID)
			else
				player.CastSkill(2461, nlev, TARGET.NPC, dwCharacterID)
			end
			--player.CastSkill(2461, nlev, player.GetSkillTarget())
		end
		--�����ݲ�
		if target.GetBuff(2309, 1) or target.GetBuff(10118, 1) then
			if IsPlayer(dwCharacterID) then
				player.CastSkill(2466, nlev, TARGET.PLAYER, dwCharacterID)
			else
				player.CastSkill(2466, nlev, TARGET.NPC, dwCharacterID)
			end
			--player.CastSkill(2466, nlev, player.GetSkillTarget())
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
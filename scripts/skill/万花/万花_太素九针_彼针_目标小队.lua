---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/��/��_̫�ؾ���_����_Ŀ��С��.lua
-- ����ʱ��:	2015/9/13 22:07:28
-- �����û�:	mengxiangfei11
-- �ű�˵��:

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nTherapyBase = 104, nTherapyRand = 10, nCostMana = 0}, --level 1
	{nTherapyBase = 129, nTherapyRand = 13, nCostMana = 0}, --level 2
	{nTherapyBase = 154, nTherapyRand = 15, nCostMana = 0}, --level 3
	{nTherapyBase = 179, nTherapyRand = 18, nCostMana = 0}, --level 4
	{nTherapyBase = 204, nTherapyRand = 20, nCostMana = 0}, --level 5
	{nTherapyBase = 229, nTherapyRand = 23, nCostMana = 0}, --level 6
	{nTherapyBase = 254, nTherapyRand = 25, nCostMana = 0}, --level 7
	{nTherapyBase = 279, nTherapyRand = 28, nCostMana = 0}, --level 8
	{nTherapyBase = 304, nTherapyRand = 30, nCostMana = 0}, --level 9
	{nTherapyBase = 329, nTherapyRand = 33, nCostMana = 0}, --level 10
	{nTherapyBase = 354, nTherapyRand = 35, nCostMana = 0}, --level 5
	{nTherapyBase = 379, nTherapyRand = 38, nCostMana = 0}, --level 6
	{nTherapyBase = 404, nTherapyRand = 40, nCostMana = 0}, --level 7
	{nTherapyBase = 429, nTherapyRand = 43, nCostMana = 0}, --level 8
	{nTherapyBase = 454, nTherapyRand = 45, nCostMana = 0}, --level 9
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.SKILL_THERAPY, -- ħ������
		tSkillData[dwSkillLevel].nTherapyBase / 3, --����ֵ1
		0							--����ֵ2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.SKILL_THERAPY_RAND, -- ħ������
		tSkillData[dwSkillLevel].nTherapyRand / 3, --����ֵ1
		0							--����ֵ2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CALL_THERAPY, -- ħ������
		0, --����ֵ1
		0							--����ֵ2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��˲��buff
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		722,
		1
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/��/��_̫�ؾ���_����_Ŀ��С��.lua",
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/��/���봦��˲��buff.lua",
		0
	);
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(3829, 10, BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- �������������Լ���Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- ����Ŀ�������Լ���Buff

	-----------------����ʩ�ż�������-------------------------------------------
	--skill.AddCheckSelfLearntSkill(2659, 2, SKILL_COMPARE_FLAG.EQUAL);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	-- ����CD
	skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetNormalCoolDown(1, 499);	--������ͨCD;
	skill.SetCheckCoolDown(1, 444)
	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- ���ܳ�� -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
	if dwSkillLevel <= 3 then
		skill.nCostManaBasePercent = 375 * 0.2;	-- �������ĵ�����
	elseif dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 375 * 0.4;	-- �������ĵ�����
	elseif dwSkillLevel <= 9 then
		skill.nCostManaBasePercent = 375 * 0.6;	-- �������ĵ�����
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 375 * 0.8;	-- �������ĵ�����
	else
		skill.nCostManaBasePercent = 375;	-- �������ĵ�����
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
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	skill.nAreaRadius = 15 * LENGTH_BASE;		-- �������ð뾶
	skill.nTargetCountLimit = 5;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	skill.nMinPrepareFrames = 1;
	skill.nPrepareFrames = 24;				-- ����֡��
	if dwSkillLevel < 15 then
		skill.nChannelInterval = 30 + dwSkillLevel * 3
	else
		skill.nChannelInterval = 82;     -- ͨ�������ʱ��
	end

	--skill.nChannelInterval = 82; 				-- ͨ�������ʱ��
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
function Apply(dwCharacterID, dwSrcID)
	local player = GetPlayer(dwSrcID)
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
	
	--player.DelBuff(6266, 1)
	local lv = player.GetSkillLevel(101)
	--�����hot
	if player.GetSkillLevel(5781) == 1 then
		if IsPlayer(dwCharacterID) then
			player.CastSkill(6105, 1, TARGET.PLAYER, dwCharacterID)
		else
			player.CastSkill(6105, 1, TARGET.NPC, dwCharacterID)
		end
	end

	--����ˢ������
	if player.GetSkillLevel(6773) == 1 then
		--print(1111)
		local nlev = player.GetSkillLevel(101)
		if nlev ~= 0 and target.GetBuffByOwner(631, nlev, player.dwID) then
			if IsPlayer(dwCharacterID) then
				player.CastSkill(14665, nlev, TARGET.PLAYER, dwCharacterID)	--ˢ������
			else
				player.CastSkill(14665, nlev, TARGET.NPC, dwCharacterID)	--ˢ������
			end
		end
	end

	--�������е�Ѫ��Ŀ�����30%����Ч��
	if player.GetSkillLevel(14666) == 1 then
		local nlev = player.GetSkillLevel(14664)
		if nlev ~= 0 then
			--player.CastSkill(14667, nlev, player.GetSkillTarget())
			if IsPlayer(dwCharacterID) then
				player.CastSkill(14667, nlev, TARGET.PLAYER, dwCharacterID)
			else
				player.CastSkill(14667, nlev, TARGET.NPC, dwCharacterID)
			end
		end
	end
	
	--[[
	if player.GetSkillLevel(5781) == 1 and not player.GetBuff(8514, 1) then
		if IsPlayer(dwCharacterID) then
			player.CastSkill(6105, 1, TARGET.PLAYER, dwCharacterID)
		else
			player.CastSkill(6105, 1, TARGET.NPC, dwCharacterID)
		end
		--���������һ���ӳ�buff,�ӳ�buff������Ż����8514����CDbuff
		player.AddBuff(player.dwID,player.nLevel,8516,1)
	end
	--]]
	--����AOE���ɾ������ʱ��
	--player.AddBuff(player.dwID,player.nLevel,8507,1)
	ModityCDToUI(player, 14664, 0, 0)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
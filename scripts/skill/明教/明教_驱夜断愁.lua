---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����_��ҹ�ϳ�.lua
-- ����ʱ��:	2016/1/8 9:44:29
-- �����û�:	mengxiangfei11
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- ������   :  ֣����
-- ����ʱ��	:  20120621
-- Ч����ע	:  ���̼���
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 137 * 0.95, nDamageRand = 137 * 0.1, nCostMana = 30 },
	{nDamageBase = 149 * 0.95, nDamageRand = 149 * 0.1, nCostMana = 50 },
	{nDamageBase = 161 * 0.95, nDamageRand = 161 * 0.1, nCostMana = 67 },
	{nDamageBase = 173 * 0.95, nDamageRand = 173 * 0.1, nCostMana = 93 },
	{nDamageBase = 185 * 0.95, nDamageRand = 185 * 0.1, nCostMana = 111},
	{nDamageBase = 197 * 0.95, nDamageRand = 197 * 0.1, nCostMana = 130},
	{nDamageBase = 209 * 0.95, nDamageRand = 209 * 0.1, nCostMana = 149},
	{nDamageBase = 221 * 0.95, nDamageRand = 221 * 0.1, nCostMana = 167},
	{nDamageBase = 233 * 0.95, nDamageRand = 233 * 0.1, nCostMana = 186},
	{nDamageBase = 245 * 0.95, nDamageRand = 245 * 0.1, nCostMana = 186},
	{nDamageBase = 257 * 0.95, nDamageRand = 257 * 0.1, nCostMana = 30 },
	{nDamageBase = 269 * 0.95, nDamageRand = 269 * 0.1, nCostMana = 50 },
	{nDamageBase = 281 * 0.95, nDamageRand = 281 * 0.1, nCostMana = 67 },
	{nDamageBase = 293 * 0.95, nDamageRand = 293 * 0.1, nCostMana = 93 },
	{nDamageBase = 305 * 0.95, nDamageRand = 305 * 0.1, nCostMana = 111},
	{nDamageBase = 317 * 0.95, nDamageRand = 317 * 0.1, nCostMana = 130},
	{nDamageBase = 329 * 0.95, nDamageRand = 329 * 0.1, nCostMana = 149},
	{nDamageBase = 341 * 0.95, nDamageRand = 341 * 0.1, nCostMana = 167},
	{nDamageBase = 353 * 0.95, nDamageRand = 353 * 0.1, nCostMana = 186},
	{nDamageBase = 365 * 0.95, nDamageRand = 365 * 0.1, nCostMana = 186},
	{nDamageBase = 377 * 0.95, nDamageRand = 377 * 0.1, nCostMana = 30 },
	{nDamageBase = 389 * 0.95, nDamageRand = 389 * 0.1, nCostMana = 50 },
	{nDamageBase = 401 * 0.95, nDamageRand = 401 * 0.1, nCostMana = 67 },
	{nDamageBase = 413 * 0.95, nDamageRand = 413 * 0.1, nCostMana = 93 },
	{nDamageBase = 425 * 0.95, nDamageRand = 425 * 0.1, nCostMana = 111},
	{nDamageBase = 437 * 0.95, nDamageRand = 437 * 0.1, nCostMana = 130},
	{nDamageBase = 449 * 0.95, nDamageRand = 449 * 0.1, nCostMana = 149},
	{nDamageBase = 461 * 0.95, nDamageRand = 461 * 0.1, nCostMana = 167},
	{nDamageBase = 473 * 0.95, nDamageRand = 473 * 0.1, nCostMana = 186},
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		4709,
		1
		);
	--]]
	--���buff��¼Ŀ��ID
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/����_��ҹ�ϳ�.lua",
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CURRENT_MOON_ENERGY,
		6000,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CURRENT_SUN_ENERGY,
		6000,
		0
	);
	--�������ͨ��
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/����ͨ��ɾbuff.lua",
		0
	);
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,			---�����˺�
	--ATTRIBUTE_TYPE.CAST_SKILL,
	--4480,
	--dwSkillLevel
	--);
	----------------- ����ʩ��Buff���� ---------------------------------------------
	skill.AddSlowCheckSelfBuff(6279, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
	skill.AddSlowCheckSelfBuff(4052, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, BUFF_COMPARE_FLAG.GREATER_EQUAL, nLevel, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- ����Ŀ��Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, BUFF_COMPARE_FLAG.GREATER_EQUAL, nLevel, BUFF_COMPARE_FLAG.GREATER_EQUAL);	-- �������������Լ���Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, BUFF_COMPARE_FLAG.GREATER_EQUAL, nLevel, BUFF_COMPARE_FLAG.GREATER_EQUAL);	-- ����Ŀ�������Լ���Buff

	-----------------����ʩ�ż�������-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, 4057, dwSkillLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

	----------------- ����Cool down --------------------------------------------
	skill.SetPublicCoolDown(503);		-- ���̹���CD 1��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetNormalCoolDown(1, 521);	--������ͨCD
	skill.SetCheckCoolDown(1, 444);	--��������CD
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
	skill.nMaxRadius = 4 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	skill.nAngleRange = 128;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶
	--skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	--skill.nChannelInterval	= 0; 				-- ͨ�������ʱ��
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
		player.AcquireAchievement(3288)
	end
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

	player.AddBuff(dwCharacterID, target.nLevel, 4709, 1)
	--[[
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local target = player.GetSelectCharacter()
	if not target then
		return
	end
	local life = target.nCurrentLife / target.nMaxLife
	local level = player.GetSkillLevel(3979)--����
	--if player.GetSkillLevel(5980) == 1 then
	--player.AddBuff(dwCharacterID, player.nLevel, 5745, 1, 1)
	--end
	if player.GetBuff(5269, 1) then --����
		--print("beici1")
		player.CastSkill(4481, level)
	end
	if player.GetBuff(5269, 2) then--����
		--print("beici2")
		if player.GetSkillLevel(5980) == 1 and life <= 0.3 then
			player.CastSkill(6258, level)
		else
			player.CastSkill(4482, level)
		end
		--player.CastSkill(4482, level)
	end
	if not player.GetBuff(5269, 1) and not player.GetBuff(5269, 2)  then
		--local level = player.GetSkillLevel(3979)--����
		if player.GetSkillLevel(5980) == 1 and life <= 0.3 then
			player.CastSkill(6257, level)
		else
			player.CastSkill(4480, level)
		end
		--print("nobeici")
	end
	if player.GetSkillLevel(5981) == 1 then
		if player.GetBuff(5882, 1) then
			player.DelBuff(5882, 1)
			player.AddBuff(dwCharacterID, player.nLevel, 5891, 1, 1)
		end
	end
	if player.GetSkillLevel(6724) == 1 then
		if life >= 0.7 then
			target.AddBuff(player.dwID, player.nLevel, 6283, 1, 1)
		end
	end
	--]]
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue, dwSkillSrcID, nStackNum, nBuffIndex, dwCasterID, dwCasterSkillID)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end

	local target
	if IsPlayer(dwSkillSrcID) then
		target = GetPlayer(dwSkillSrcID)
	else
		target = GetNpc(dwSkillSrcID)
	end
	if not target then
		return
	end
	local life = target.nCurrentLife / target.nMaxLife
	local level = player.GetSkillLevel(3979)--����
	--if player.GetSkillLevel(5980) == 1 then
	--player.AddBuff(dwCharacterID, player.nLevel, 5745, 1, 1)
	--end
	if player.GetBuff(5269, 1) then --����
		--print("beici1")
		--player.CastSkill(4481, level)
		if IsPlayer(dwSkillSrcID) then
			player.CastSkill(4481, level, TARGET.PLAYER, dwSkillSrcID)
		else
			player.CastSkill(4481, level, TARGET.NPC, dwSkillSrcID)
		end
	end
	print(11111)
	if player.GetBuff(5269, 2) then--����
		--print("beici2")
		if	player.GetSkillLevel(5980) == 1 and life <= 0.4 then
			--player.GetSkillLevel(5980) == 1 and life <= 0.3 then
			if IsPlayer(dwSkillSrcID) then
				player.CastSkill(6258, level, TARGET.PLAYER, dwSkillSrcID)
			else
				player.CastSkill(6258, level, TARGET.NPC, dwSkillSrcID)
			end
		else
			if IsPlayer(dwSkillSrcID) then
				player.CastSkill(4482, level, TARGET.PLAYER, dwSkillSrcID)
			else
				player.CastSkill(4482, level, TARGET.NPC, dwSkillSrcID)
			end
		end
		--player.CastSkill(4482, level)
	end
	if not player.GetBuff(5269, 1) and not player.GetBuff(5269, 2)  then
		--local level = player.GetSkillLevel(3979)--����
		if player.GetSkillLevel(5980) == 1 and life <= 0.4 then
			if IsPlayer(dwSkillSrcID) then
				player.CastSkill(6257, level, TARGET.PLAYER, dwSkillSrcID)
			else
				player.CastSkill(6257, level, TARGET.NPC, dwSkillSrcID)
			end
		else
			if IsPlayer(dwSkillSrcID) then
				player.CastSkill(4480, level, TARGET.PLAYER, dwSkillSrcID)
			else
				player.CastSkill(4480, level, TARGET.NPC, dwSkillSrcID)
			end
		end
		--print("nobeici")
	end
	if player.GetSkillLevel(5981) == 1 then
		if player.GetBuff(5882, 1) then
			player.DelBuff(5882, 1)
			player.AddBuff(dwCharacterID, player.nLevel, 5891, 1, 1)
		end
	end
	if player.GetSkillLevel(6724) == 1 then
		if life >= 0.7 then
			target.AddBuff(player.dwID, player.nLevel, 6283, 1, 1)
		end
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��·���Ӽ���/����_��_��_����.lua
-- ����ʱ��:	2017/5/17 16:36:51
-- �����û�:	XIAXIANBO1
-- �ű�˵��:
----------------------------------------------------------------------<
---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��·���Ӽ���/����_��_��_����.lua
-- ����ʱ��:	2015/8/10 13:00:03
-- �����û�:	mengxiangfei11
-- �ű�˵��:
--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 1
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 2
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 3
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 4
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 5
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 6
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 7
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 8
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 9
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 10
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------
	--����Ѩ��Ŀ�������ƶ�״̬
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		14354,
		dwSkillLevel
	);
	--����Ѩ��Ŀ���ܿ�״̬
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		14355,
		dwSkillLevel
	);
	--����Ѩ����buff������״̬
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		14356,
		dwSkillLevel
	);
	--����Ѩ����buff���ܿ�״̬
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		14513,
		dwSkillLevel
	);
	--����Ѩ����buff
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		14514,
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.ACCUMULATE, -- ħ������
		1, -- ����ֵ1
		0														-- ����ֵ2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/��·���Ӽ���/����_��_��_����.lua",
		0
	);
	----------------- ����ʩ��Buff���� ---------------------------------------------
	skill.AddSlowCheckSelfBuff(9506, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ��������Buff
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- �������������Լ���Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- ����Ŀ�������Լ���Buff

	-----------------����ʩ�ż�������-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --���Ƚ�Caster�Լ���ѧϰ�ļ���ID�͵ȼ�

	-----------------����ʩ����̬����(����)----------------------------------------
	--skill.nNeedPoseState = 1    --�����̬��1Ϊ�浶��̬��2Ϊ�����̬

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
	skill.SetPublicCoolDown(16);							-- ����CD 1.5��
	-- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetNormalCoolDown(1, 895);	--������ͨCD
	skill.SetCheckCoolDown(1, 444);	--ֻ��鲻�ߵ�CD
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
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 300 * 0.2;	-- �������ĵ�����
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 300 * 0.4;	-- �������ĵ�����
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 300 * 0.6;	-- �������ĵ�����
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 300 * 0.8;	-- �������ĵ�����
	else
		skill.nCostManaBasePercent = 300;	-- �������ĵ�����
	end
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
	skill.nMaxRadius = 20 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	--skill.nAreaRadius		= 6 * LENGTH_BASE;		-- �������ð뾶
	skill.nTargetCountLimit = 1;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	----------------- ʱ����� -------------------------------------------------
	--skill.nMinChannelInterval = 1;-- ͨ�������ʱ��
	--skill.nChannelInterval = 16; 				-- ͨ�������ʱ��
	--skill.nChannelFrame = 48;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nMinChannelFrame = 1
	--skill.nBulletVelocity = 0;				-- �ӵ��ٶȣ���λ ��/֡

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
	--skill.nWeaponDamagePercent = 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%

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
	if skill.dwLevel == skill.dwMaxLevel and not player.IsAchievementAcquired(4652) then
		player.AcquireAchievement(4652)
	end
end

--��������ʱִ�еĺ���,����skillΪ������skill
function OnSkillForgotten(skill, player)

end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end

	local target
	local nType
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
		nType = TARGET.PLAYER
	else
		target = GetNpc(dwCharacterID)
		nType = TARGET.NPC
	end
	if not target then
		return
	end

	--վ������������������
	if player.GetBuff(10161, 1) then
		player.DelBuff(10161, 1)
		player.CastSkill(15170, 1)
	elseif player.GetBuff(10160, 1) then
		player.DelBuff(10160, 1)
		player.AddBuff(player.dwID, player.nLevel, 10161, 1)
		player.CastSkill(15169, 1)
	else
		player.AddBuff(player.dwID, player.nLevel, 10160, 1)
		player.CastSkill(15168, 1)
	end

	--���������������1��buff����һ��������buff����2��(���)��
	if player.GetSkillLevel(14353) == 1 then
		if player.GetSkillLevel(14437) == 1 then
			if not player.GetBuff(9503, 3) then
				if not player.GetBuff(9503, 2) then
					if not player.GetBuff(9503, 1) then
						player.AddBuff(player.dwID, player.nLevel, 9503, 1)
					else
						player.DelBuff(9503, 1)
						player.AddBuff(player.dwID, player.nLevel, 9503, 2)
					end
				else
					player.DelBuff(9503, 2)
					player.AddBuff(player.dwID, player.nLevel, 9503, 3)
				end
			else
				player.AddBuff(player.dwID, player.nLevel, 9503, 3)
			end
		else
			if not player.GetBuff(9439, 3) then
				if not player.GetBuff(9439, 2) then
					if not player.GetBuff(9439, 1) then
						player.AddBuff(player.dwID, player.nLevel, 9439, 1)
					else
						player.DelBuff(9439, 1)
						player.AddBuff(player.dwID, player.nLevel, 9439, 2)
					end
				else
					player.DelBuff(9439, 2)
					player.AddBuff(player.dwID, player.nLevel, 9439, 3)
				end
			else
				player.AddBuff(player.dwID, player.nLevel, 9439, 3)
			end
		end
	end

	--�������Ч��(ɾ����)
	if player.GetSkillLevel(14281) == 1 then
		player.AddBuff(player.dwID, player.nLevel, 9354, 1)
	end

	--��ʩչ�������ƻ��ļ������10%
	if player.GetSkillLevel(14439) == 1 then
		player.AddBuff(player.dwID, player.nLevel, 9496, 1)
	end

	--�ؼ��������ܿ�Ŀ��һ��һ��������Ч��(���)
	if player.IsSkillRecipeActive(2104, 1) then
		player.CastSkill(14357, 1, player.GetSkillTarget())
	end

	--����ÿ���������2%���ƻ�������(���)
	if player.GetSkillLevel(14359) == 1 then
		player.AddBuff(player.dwID, player.nLevel, 9441, 1)
	end

	--���������Ŀ��������������hot
	if player.GetSkillLevel(14461) == 1 then
		local nleftCount_gong = 0
		local nleftCount_shang = 0
		local nleftCount_jue = 0
		local nConsume_lev = 0
		--�ҹ�hot
		local gong_lev = player.GetSkillLevel(14303)
		if gong_lev ~= 0 then
			local gong_1 = target.GetBuffByOwner(9454, gong_lev, player.dwID)
			local gong_2 = target.GetBuffByOwner(9455, gong_lev, player.dwID)
			local gong_3 = target.GetBuffByOwner(9456, gong_lev, player.dwID)
			local gong_4 = target.GetBuffByOwner(9457, gong_lev, player.dwID)
			if gong_1 then
				nleftCount_gong = gong_1.nLeftActiveCount
			elseif gong_2 then
				nleftCount_gong = gong_2.nLeftActiveCount
			elseif gong_3 then
				nleftCount_gong = gong_3.nLeftActiveCount
			elseif gong_4 then
				nleftCount_gong = gong_4.nLeftActiveCount
			end
		end
		--����hot
		local shang_lev = player.GetSkillLevel(14138)
		if shang_lev ~= 0 then
			local shang_1 = target.GetBuffByOwner(9459, shang_lev, player.dwID)
			local shang_2 = target.GetBuffByOwner(9460, shang_lev, player.dwID)
			local shang_3 = target.GetBuffByOwner(9461, shang_lev, player.dwID)
			local shang_4 = target.GetBuffByOwner(9462, shang_lev, player.dwID)
			if shang_1 then
				nleftCount_shang = shang_1.nLeftActiveCount
			elseif shang_2 then
				nleftCount_shang = shang_2.nLeftActiveCount
			elseif shang_3 then
				nleftCount_shang = shang_3.nLeftActiveCount
			elseif shang_4 then
				nleftCount_shang = shang_4.nLeftActiveCount
			end
		end
		--�ҽ�hot
		local jue_lev = player.GetSkillLevel(14139)
		if jue_lev ~= 0 then
			local jue_1 = target.GetBuffByOwner(9463, jue_lev, player.dwID)
			local jue_2 = target.GetBuffByOwner(9464, jue_lev, player.dwID)
			local jue_3 = target.GetBuffByOwner(9465, jue_lev, player.dwID)
			local jue_4 = target.GetBuffByOwner(9466, jue_lev, player.dwID)
			if jue_1 then
				nleftCount_jue = jue_1.nLeftActiveCount
			elseif jue_2 then
				nleftCount_jue = jue_2.nLeftActiveCount
			elseif jue_3 then
				nleftCount_jue = jue_3.nLeftActiveCount
			elseif jue_4 then
				nleftCount_jue = jue_4.nLeftActiveCount
			end
		end
		local newtable = {}
		if nleftCount_gong ~= 0 then
			newtable[#newtable + 1] = 1
		end

		if nleftCount_jue ~= 0 then
			newtable[#newtable + 1] = 2
		end

		if nleftCount_shang ~= 0 then
			newtable[#newtable + 1] = 3
		end
		if #newtable ~= 0 then
			local nRnd = math.random(1, #newtable)
			if newtable[nRnd] == 1 then
				if target.GetBuffByOwner(9454, gong_lev, player.dwID) then
					player.CastSkill(14389, gong_lev, nType, target.dwID)
				elseif target.GetBuffByOwner(9455, gong_lev, player.dwID) then
					player.CastSkill(14390, gong_lev, nType, target.dwID)
				elseif target.GetBuffByOwner(9456, gong_lev, player.dwID) then
					player.CastSkill(14391, gong_lev, nType, target.dwID)
				elseif target.GetBuffByOwner(9457, gong_lev, player.dwID) then
					player.CastSkill(14393, gong_lev, nType, target.dwID)
				end
			elseif newtable[nRnd] == 2 then
				if target.GetBuffByOwner(9463, jue_lev, player.dwID) then
					player.CastSkill(14399, jue_lev, nType, target.dwID)
				elseif target.GetBuffByOwner(9464, jue_lev, player.dwID) then
					player.CastSkill(14400, jue_lev, nType, target.dwID)
				elseif target.GetBuffByOwner(9465, jue_lev, player.dwID) then
					player.CastSkill(14401, jue_lev, nType, target.dwID)
				elseif target.GetBuffByOwner(9466, jue_lev, player.dwID) then
					player.CastSkill(14402, jue_lev, nType, target.dwID)
				end
			else
				if target.GetBuffByOwner(9459, shang_lev, player.dwID) then
					player.CastSkill(14395, shang_lev, nType, target.dwID)
				elseif target.GetBuffByOwner(9460, shang_lev, player.dwID) then
					player.CastSkill(14396, shang_lev, nType, target.dwID)
				elseif target.GetBuffByOwner(9461, shang_lev, player.dwID) then
					player.CastSkill(14397, shang_lev, nType, target.dwID)
				elseif target.GetBuffByOwner(9462, shang_lev, player.dwID) then
					player.CastSkill(14398, shang_lev, nType, target.dwID)
				end
			end
			player.CastSkill(14462, newtable[nRnd], nType, target.dwID)
		end
	end
	--����һ��ʫ��Ч��
	--player.DelBuff(9329, 1)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
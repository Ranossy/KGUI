---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Map/���ǲ��/��ݵ���.lua
-- ����ʱ��:	2015/9/21 17:52:42
-- �����û�:	xutong3
-- �ű�˵��:
----------------------------------------------------------------------<

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
--	{nTherapy  = 6000000, 	nTherapyRand = 12345,  nCostMana = 0 },
	--{nTherapy  = 187/3*0.95, 	nTherapyRand = 187/3*0.1,  nCostMana = 0 },
	--{nTherapy  = 224/3*0.95, 	nTherapyRand = 224/3*0.1,  nCostMana = 0 },
	--{nTherapy  = 261/3*0.95, 	nTherapyRand = 261/3*0.1,  nCostMana = 0 },
	--{nTherapy  = 298/3*0.95, 	nTherapyRand = 298/3*0.1,  nCostMana = 0},
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"Map/ACT_���ǲ��/npc/�����Ů.lua", -- ����ֵ1
		0											-- ����ֵ2
	);
	--ִ�нű�ɾ������������buff
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
	--ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
	--"skill/npc/��ֵ�/���ݷ�_��.lua",
	--0
	--);
	--[[
	--���м���˳��һ�����ܷ�(����Ҫ��һ����й�ϵ)
	--����Ѩ�Ӽ���G
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		14445,
		dwSkillLevel
	);
	--����Ѩ�Ӽ���F
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		14367,
		dwSkillLevel
	);
	--����Ѩ�Ӽ���E
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		14366,
		dwSkillLevel
	);
	--����Ѩ�Ӽ���D
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		14365,
		dwSkillLevel
	);
	--����Ѩ�Ӽ���C
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		14364,
		dwSkillLevel
	);
	--����Ѩ�Ӽ���B
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		14363,
		dwSkillLevel
		);
	--]]
	--�����Ӽ���A
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	--ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
	--14362,
	--dwSkillLevel
	--);
	--��Ѩÿ�������˺��ж��Ӽ���(����buff)
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	--ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
	--14530,
	--1
	--);
	--�ж������ظ���
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	--ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
	--14535,
	--1
	--);
	----------------- ����ʩ��Buff���� ---------------------------------------------
--	skill.AddSlowCheckSelfBuff(9377, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ��������Buff
--	skill.AddSlowCheckSelfBuff(9506, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ��������Buff
	--���������ڼ�û�и�ɽ��ˮ��״̬�����ͷŹ���ı��buff
--	skill.AddSlowCheckSelfBuff(9552, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ��������Buff
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
	--����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetNormalCoolDown(1, 895);	--������ͨCD
	--skill.SetCheckCoolDown(1, 444);	--ֻ��鲻�ߵ�CD
	--skill.SetCheckCoolDown(2, 920);	--ֻ��鲻�ߵ�CD,��ʼ����hot����һ��CD
	--skill.SetCheckCoolDown(3, 921);	--ֻ��鲻�ߵ�CD,��ʼ����hot���Ӷ���CD
	--skill.SetCheckCoolDown(4, 922);	--ֻ��鲻�ߵ�CD,��ʼ����hot��������CD
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
	--if dwSkillLevel <= 6 then
	--skill.nCostManaBasePercent = 163 * 0.1;	-- �������ĵ�����
	--elseif dwSkillLevel <= 12 then
	--skill.nCostManaBasePercent = 163 * 0.2;	-- �������ĵ�����
	--elseif dwSkillLevel <= 18 then
	--skill.nCostManaBasePercent = 163 * 0.4;	-- �������ĵ�����
	--elseif dwSkillLevel <= 24 then
	--skill.nCostManaBasePercent = 163 * 0.7;	-- �������ĵ�����
	--else
	--skill.nCostManaBasePercent = 163;	-- �������ĵ�����
	--end

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
	skill.nAreaRadius = 30 * LENGTH_BASE;		-- �������ð뾶
	skill.nTargetCountLimit = 30;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)
	skill.bInstantChannel = false;				-- ͨ�������Ƿ��������һ���˺�
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	--skill.nMinPrepareFrames  	= -1;				-- ����Ч����С����֡����Ĭ����-1���������ܼ���Ӱ�졣���ڵ���0���ܼ���Ӱ�죬��С����ʱ��Ϊ���ֵ
	skill.nChannelInterval = 128; 				-- ͨ�������ʱ��
	skill.nMinChannelInterval = 1; 				-- ����Ч����Сͨ�������ʱ�䣺Ĭ����-1��ͨ�����ܼ���Ӱ�졣���ڵ���0���ܼ���Ӱ�죬��ͨ�����ʱ��Ϊ���ֵ
	skill.nChannelFrame = 1024;	 			-- ͨ��������ʱ�䣬��λ֡��
	skill.nMinChannelFrame = 1; 				-- ͨ����ϼ�����С���ʱ��ʹ�á�ʹ��ͨ������������١���������-1���������-1���߼��ٿ��Զ�1��
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
	skill.nBeatBackRate = 1 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
	skill.nBrokenRate = 1 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
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
	--local lv = skill.dwLevel
	--player.LearnSkillLevel(14301, lv, player.dwID)	--ѧϰ��������
end

--��������ʱִ�еĺ���,����skillΪ������skill
function OnSkillForgotten(skill, player)

end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	--local player = GetPlayer(dwSkillSrcID)
	--if not player then
	--return
	--end

	--local target
	--if IsPlayer(dwCharacterID) then
	--target = GetPlayer(dwCharacterID)
	--else
	--target = GetNpc(dwCharacterID)
	--end

	--if not target then
	--return
	--end

	--ɾ�����������������buff
	--player.DelGroupBuff(9439, 1)
	--player.DelGroupBuff(9439, 2)
	--player.DelGroupBuff(9439, 3)
	--ɾ�����������������buff
	--player.DelGroupBuff(9503, 1)
	--player.DelGroupBuff(9503, 2)
	--player.DelGroupBuff(9503, 3)

	--ʫ�ϣ���15���ʵ��ӱ��buff
	--if player.GetSkillLevel(14233) == 1 then
	--local nRnd = Random(1, 10000)
	--if nRnd <= 1500 and not player.GetBuff(9380, 1) then
	--player.AddBuff(player.dwID, player.nLevel, 9329, 1)
	--player.AddBuff(player.dwID, player.nLevel, 9380, 1)		--����AOE�����Ŀ��ʱ��ÿ����μ������
	--end
	--end

	--������Ѩ������Ŀ��hot���ӵ�Ϣʱ��
	--if player.GetSkillLevel(14472) == 1 then
	--print(1111)
	--local gong_lev = player.GetSkillLevel(14303)
	--local shang_lev = player.GetSkillLevel(14138)
	--local jue_lev = player.GetSkillLevel(14139)

	--local gong_leftcount = 0
	--local shang_leftcount = 0
	--local jue_leftcount = 0

	--if gong_lev ~= 0 then
	--print("gong_lev"..gong_lev)
	--local gong_hot_1 = target.GetBuffByOwner(9454, gong_lev, player.dwID)
	--local gong_hot_2 = target.GetBuffByOwner(9455, gong_lev, player.dwID)
	--local gong_hot_3 = target.GetBuffByOwner(9456, gong_lev, player.dwID)
	--local gong_hot_4 = target.GetBuffByOwner(9457, gong_lev, player.dwID)
	--if gong_hot_1 then
	--gong_leftcount = gong_hot_1.nLeftActiveCount
	--elseif gong_hot_2 then
	--gong_leftcount = gong_hot_2.nLeftActiveCount
	--elseif gong_hot_3 then
	--gong_leftcount = gong_hot_3.nLeftActiveCount
	--elseif gong_hot_4 then
	--gong_leftcount = gong_hot_4.nLeftActiveCount
	--end
	--end
	--if shang_lev ~= 0 then
	--print("shang_lev"..shang_lev)
	--local shang_hot_1 = target.GetBuffByOwner(9459, shang_lev, player.dwID)
	--local shang_hot_2 = target.GetBuffByOwner(9460, shang_lev, player.dwID)
	--local shang_hot_3 = target.GetBuffByOwner(9461, shang_lev, player.dwID)
	--local shang_hot_4 = target.GetBuffByOwner(9462, shang_lev, player.dwID)
	--if shang_hot_1 then
	--shang_leftcount = shang_hot_1.nLeftActiveCount
	--elseif shang_hot_2 then
	--shang_leftcount = shang_hot_2.nLeftActiveCount
	--elseif shang_hot_3 then
	--shang_leftcount = shang_hot_3.nLeftActiveCount
	--elseif shang_hot_4 then
	--shang_leftcount = shang_hot_4.nLeftActiveCount
	--end
	--end
	--if jue_lev ~= 0 then
	--print("jue_lev"..jue_lev)
	--local jue_hot_1 = target.GetBuffByOwner(9463, jue_lev, player.dwID)
	--local jue_hot_2 = target.GetBuffByOwner(9464, jue_lev, player.dwID)
	--local jue_hot_3 = target.GetBuffByOwner(9465, jue_lev, player.dwID)
	--local jue_hot_4 = target.GetBuffByOwner(9466, jue_lev, player.dwID)
	--if jue_hot_1 then
	--jue_leftcount = jue_hot_1.nLeftActiveCount
	--elseif jue_hot_2 then
	--jue_leftcount = jue_hot_2.nLeftActiveCount
	--elseif jue_hot_3 then
	--jue_leftcount = jue_hot_3.nLeftActiveCount
	--elseif jue_hot_4 then
	--jue_leftcount = jue_hot_4.nLeftActiveCount
	--end
	--end
	--print(gong_leftcount)
	--print(shang_leftcount)
	--print(jue_leftcount)
	--local buff_mark = player.GetBuff(9538, 1)
	--if (buff_mark and buff_mark.nStackNum < 2) or not buff_mark then
	--print(2222222222)
	--if jue_leftcount ~= 0 and jue_leftcount >= gong_leftcount and jue_leftcount >= shang_leftcount then
	--���ɽ�hot
	--print(333333333333333)
	--player.CastSkill(14500, 1, player.GetSkillTarget())
	--if not buff_mark then
	--if player.GetSkillLevel(14352) == 1 then
	--player.ResetCD(923)
	--else
	--player.ResetCD(920)
	--end
	--elseif buff_mark and buff_mark.nStackNum == 1 then
	--if player.GetSkillLevel(14352) == 1 then
	--player.ResetCD(924)
	--else
	--player.ResetCD(921)
	--end
	--end
	--player.AddBuff(player.dwID, player.nLevel, 9538, 1)
	--elseif shang_leftcount ~= 0 and shang_leftcount >= jue_leftcount and shang_leftcount >= gong_leftcount then
	--������hot
	--print(44444444444)
	--player.CastSkill(14499, 1, player.GetSkillTarget())
	--if not buff_mark then
	--if player.GetSkillLevel(14352) == 1 then
	--player.ResetCD(923)
	--else
	--player.ResetCD(920)
	--end
	--elseif buff_mark and buff_mark.nStackNum == 1 then
	--if player.GetSkillLevel(14352) == 1 then
	--player.ResetCD(924)
	--else
	--player.ResetCD(921)
	--end
	--end
	--player.AddBuff(player.dwID, player.nLevel, 9538, 1)
	--elseif gong_leftcount ~= 0 and gong_leftcount >= shang_leftcount and gong_leftcount >= jue_leftcount then
	--���ɹ�hot
	--print(5555555555555)
	--player.CastSkill(14498, 1, player.GetSkillTarget())
	--if not buff_mark then
	--if player.GetSkillLevel(14352) == 1 then
	--player.ResetCD(923)
	--else
	--player.ResetCD(920)
	--end
	--elseif buff_mark and buff_mark.nStackNum == 1 then
	--if player.GetSkillLevel(14352) == 1 then
	--player.ResetCD(924)
	--else
	--player.ResetCD(921)
	--end
	--end
	--player.AddBuff(player.dwID, player.nLevel, 9538, 1)
	--end
	--end
	--end

	--�ؼ�������Ŀ��20%����Ч��
	--if player.IsSkillRecipeActive(2088, 1) then
	--target.AddBuff(player.dwID, player.nLevel, 9533, 1)
	--end

	--player.AddBuff(player.dwID, player.nLevel, 9430, 1, 8)	--������ѩ��������buff
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
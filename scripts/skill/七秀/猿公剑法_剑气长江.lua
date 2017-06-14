---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/Գ������_��������.lua
-- ����ʱ��:	2017/3/15 19:15:09
-- �����û�:	chenchen6-pc
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- ������    :  kingbeyond
-- ����ʱ��  :  2009-3-13
-- ����Ч��  :  ���������˺���10%�˺������ѻ���
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nLunarDamage = 21, nLunarDamageRand = 33 * 2 * 0.04, nCostMana = 30 },
	{nLunarDamage = 76, nLunarDamageRand = 41 * 2 * 0.04, nCostMana = 50 },
	{nLunarDamage = 80, nLunarDamageRand = 50 * 2 * 0.04, nCostMana = 67 },
	{nLunarDamage = 81, nLunarDamageRand = 58 * 2 * 0.04, nCostMana = 93 },
	{nLunarDamage = 84, nLunarDamageRand = 67 * 2 * 0.04, nCostMana = 111},
	{nLunarDamage = 255 * 2 * 0.98, nLunarDamageRand = 75 * 2 * 0.04, nCostMana = 130},
	{nLunarDamage = 264 * 2 * 0.98, nLunarDamageRand = 84 * 2 * 0.04, nCostMana = 149},
	{nLunarDamage = 272 * 2 * 0.98, nLunarDamageRand = 92 * 2 * 0.04, nCostMana = 167},
	{nLunarDamage = 281 * 2 * 0.98, nLunarDamageRand = 101 * 2 * 0.04, nCostMana = 186},
	{nLunarDamage = 289 * 2 * 0.98, nLunarDamageRand = 109 * 2 * 0.04, nCostMana = 186},
	{nLunarDamage = 298 * 2 * 0.98, nLunarDamageRand = 118 * 2 * 0.04, nCostMana = 30 },
	{nLunarDamage = 306 * 2 * 0.98, nLunarDamageRand = 126 * 2 * 0.04, nCostMana = 50 },
	{nLunarDamage = 325 * 2 * 0.98, nLunarDamageRand = 135 * 2 * 0.04, nCostMana = 67 },
	{nLunarDamage = 323 * 2 * 0.98, nLunarDamageRand = 143 * 2 * 0.04, nCostMana = 93 },
	{nLunarDamage = 332 * 2 * 0.98, nLunarDamageRand = 152 * 2 * 0.04, nCostMana = 111},
	{nLunarDamage = 340 * 2 * 0.98, nLunarDamageRand = 160 * 2 * 0.04, nCostMana = 130},
	{nLunarDamage = 349 * 2 * 0.98, nLunarDamageRand = 169 * 2 * 0.04, nCostMana = 149},
	{nLunarDamage = 357 * 2 * 0.98, nLunarDamageRand = 177 * 2 * 0.04, nCostMana = 167},
	{nLunarDamage = 366 * 2 * 0.98, nLunarDamageRand = 186 * 2 * 0.04, nCostMana = 186},
	{nLunarDamage = 374 * 2 * 0.98, nLunarDamageRand = 194 * 2 * 0.04, nCostMana = 186},
	{nLunarDamage = 383 * 2 * 0.98, nLunarDamageRand = 203 * 2 * 0.04, nCostMana = 30 },
	{nLunarDamage = 391 * 2 * 0.98, nLunarDamageRand = 211 * 2 * 0.04, nCostMana = 50 },
	{nLunarDamage = 400 * 2 * 0.98, nLunarDamageRand = 220 * 2 * 0.04, nCostMana = 67 },
	{nLunarDamage = 408 * 2 * 0.98, nLunarDamageRand = 228 * 2 * 0.04, nCostMana = 93 },
	{nLunarDamage = 417 * 2 * 0.98, nLunarDamageRand = 237 * 2 * 0.04, nCostMana = 111},
	{nLunarDamage = 425 * 2 * 0.98, nLunarDamageRand = 245 * 2 * 0.04, nCostMana = 130},
	{nLunarDamage = 434 * 2 * 0.98, nLunarDamageRand = 254 * 2 * 0.04, nCostMana = 149},
	{nLunarDamage = 442 * 2 * 0.98, nLunarDamageRand = 262 * 2 * 0.04, nCostMana = 167},
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel

	----�����˺��󷨵�����
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		787,
		1
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE,
		tSkillData[dwSkillLevel].nLunarDamage * 0.2,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nLunarDamageRand * 0.5,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_LUNAR_DAMAGE,
		0,
		0
	);
--[[   	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
        ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
        "skill/����/����_�߾�����.lua", 	-- ��Э��
        0
    );--]]

	--2011��4��18����ӽ����������Ľ���2��.�ź�
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/�����ķ�_ȥ������.lua",
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/�����ķ�_ȥ������.lua",
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/�����ķ�_ȥ������.lua",
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/����_���Ҽ���_�㱬.lua",
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/Գ������_��������.lua",
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.ACCUMULATE, -- ħ������
 - 3, -- ����ֵ1
		0														-- ����ֵ2
	);

	for i = 1, 3 do
		for j = 1, 3 do
			skill.AddAttribute(
				ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
				ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
				6213,
				i
			);
		end
	end

	skill.AddAttribute(														--70���似��
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		3083,
		1
	);

	skill.AddAttribute(														--80���似��
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		3047,
		1
	);

	----------------- ����CoolDown ---------------------------------------------------------------------
	skill.AddSlowCheckSelfBuff(409, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
	skill.AddSlowCheckSelfBuff(5866, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);	--����CD
	skill.SetNormalCoolDown(1, 123);	--����CD10��
	skill.SetCheckCoolDown(1, 444);
	--skill.nDamageToManaForParty = 51;	-- �˺���5%תΪ�������

	--skill.AddSlowCheckSelfBuff(409, 3, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL)   --������BUFF

	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 472 * 0.2 * 0.9 * 0.8;	-- �������ĵ�����
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 472 * 0.4 * 0.9 * 0.8;	-- �������ĵ�����
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 472 * 0.6 * 0.9 * 0.8;	-- �������ĵ�����
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 472 * 0.8 * 0.9 * 0.8;	-- �������ĵ�����
	else
		skill.nCostManaBasePercent = 472 * 0.9 * 0.8;	-- �������ĵ�����
	end
	--------------- ����������� ----------------------------------------------------------------------

	-- skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	-- skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = 20 * LENGTH_BASE;						--����ʩ�����뾶
	skill.nAngleRange = 128; 									--ʩ�ŽǶ�

	skill.nPrepareFrames = 0;										--����֡��,16֡����1��
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 64 * 1.1 * 1.2 * 1.1;
	elseif dwSkillLevel < 28 then
		skill.nChannelInterval = (64 + (dwSkillLevel - 9) * 4) * 1.1 * 1.2 * 1.1
	else
		skill.nChannelInterval = 152 * 1.1 * 1.2 * 1.1;     -- ͨ�������ʱ��
	end

	--skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡

	skill.nBreakRate = 1024;									--����ϵĸ���,Ĭ��1024��ʾһ�������

	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	if player.GetBuff(1383, 2) or player.GetBuff(8528, 1) then
		return nPreResult;
	end
	local nLevel = player.GetSkillLevel(537)
	if player.GetBuff(409, nLevel) then
		local	nBuff = player.GetBuff(409, nLevel)
		local   stackNum = nBuff.nStackNum
		if stackNum < 4  then
			return false
		end
	end
	if player.GetBuff(409, nLevel + 7) then
		local	nBuff = player.GetBuff(409, nLevel + 7)
		local   stackNum = nBuff.nStackNum
		if stackNum < 4  then
			return false
		end
	end
	if player.GetBuff(409, nLevel + 14) then
		local	nBuff = player.GetBuff(409, nLevel + 14)
		local   stackNum = nBuff.nStackNum
		if stackNum < 4  then
			return false
		end
	end

	return nPreResult;

end

function OnSkillLevelUp(skill, player)
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(50)
	end
	-- if player.IsAchievementAcquired(49) and player.IsAchievementAcquired(50) and player.IsAchievementAcquired(51) and player.IsAchievementAcquired(52) and player.IsAchievementAcquired(53) and player.IsAchievementAcquired(54) then
	-- player.AcquireAchievement(70)
	-- end
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
	--5%������Ч��
	if player.GetSkillLevel(14705) == 1 then
		target.AddBuff(player.dwID, player.nLevel, 7683, 1)
	end

	--Ԫ����ӻ���
	if target.nCurrentLife <= target.nMaxLife * 0.5 then
		if player.GetSkillLevel(6561) == 1 then
			player.AddBuff(dwCharacterID, player.nLevel, 6418, 1, 1)
		end
	end

	local nLevel = player.GetSkillLevel(537)
	if not nLevel then
		return
	end
	--[[
	local lv = player.GetSkillLevel(561)
	if not lv then
		return
	end

	if player.GetSkillLevel(5860) == 1 then
		player.CastSkill(9114, lv)
	end
	--]]
	--[[
	if player.GetBuff(1383, 2) or player.GetBuff(8528, 1) then
		for i = 1, 3 do
			player.CastSkill(6213, 1)
		end
	end
	--]]
	--[[
	if player.GetSkillLevel(6571) == 1 then
		if not player.GetBuff(6421, 1) then
			if player.GetBuff(409, nLevel) and player.GetBuff(409, nLevel).nStackNum <= 1 then
				for i = 1, 10 do
					player.AddBuff(player.dwID, player.nLevel, 409, nLevel)
				end
				player.AddBuff(0,99,6432,1)
				player.AddBuff(0, 99, 6421, 1)  -- ����CD
			end
			if player.GetBuff(409, nLevel + 7) and player.GetBuff(409, nLevel+7).nStackNum <= 1 then
				for i = 1, 10 do
					player.AddBuff(player.dwID, player.nLevel, 409, nLevel+7)
				end
				player.AddBuff(0,99,6432,1)
				player.AddBuff(0, 99, 6421, 1)
			end
			if player.GetBuff(409, nLevel + 14) and player.GetBuff(409, nLevel+14).nStackNum <= 1 then
				for i = 1, 10 do
					player.AddBuff(player.dwID, player.nLevel, 409, nLevel+14)
				end
				player.AddBuff(0,99,6432,1)
				player.AddBuff(0,99,6421,1)
			end
			player.AddBuff(dwCharacterID, player.nLevel, 5865, 1, 1)
			player.AddBuff(dwCharacterID, player.nLevel, 5866, 1, 1)
		end
	end
	--]]
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
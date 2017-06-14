---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/Գ������_��ն����.lua
-- ����ʱ��:	2017/3/15 19:41:46
-- �����û�:	chenchen6-pc
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  Գ������_��ն����.lua
-- ������    :  �ź�
-- ����ʱ��  :  2011-04-16
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �ڹ�
-- �书��·  :  Գ������
-- ��������  :  ��ն����
-- ����Ч��  :  ǿ����նɱ
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamage = 125 * 0.98, nDamageRand = 94 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 130 * 0.98, nDamageRand = 102 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 135 * 0.98, nDamageRand = 110 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 140 * 0.98, nDamageRand = 118 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 145 * 0.98, nDamageRand = 126 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 150 * 0.98, nDamageRand = 134 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 155 * 0.98, nDamageRand = 142 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 160 * 0.98, nDamageRand = 150 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 165 * 0.98, nDamageRand = 158 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 170 * 0.98, nDamageRand = 166 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 174 * 0.98, nDamageRand = 174 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 182 * 0.98, nDamageRand = 182 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 190 * 0.98, nDamageRand = 190 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 198 * 0.98, nDamageRand = 198 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 206 * 0.98, nDamageRand = 206 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 214 * 0.98, nDamageRand = 214 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 222 * 0.98, nDamageRand = 222 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 230 * 0.98, nDamageRand = 230 * 0.04, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	skill.SetSubsectionSkill(1, 1, 2988, dwSkillLevel);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE,
		tSkillData[dwSkillLevel].nDamage / 2,
		dwSkillLevel
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand / 2,
		dwSkillLevel
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_LUNAR_DAMAGE,
		0,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/Գ������_��ն����.lua",
		0
	);
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/����_�Ӽ���_��ն����.lua",
		0
	);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.ACCUMULATE, -- ħ������
 - 6, -- ����ֵ1
		0														-- ����ֵ2
	);
	for i = 1, 3 do
		for j = 1, 6 do
			skill.AddAttribute(
				ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
				ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
				6213,
				i
			);
		end
	end
	skill.BindBuff(1, 2838, 1);
	skill.AddSlowCheckSelfBuff(409, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
	skill.AddSlowCheckSelfBuff(5865, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);

	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);		--����CD1��
	skill.SetNormalCoolDown(1, 451);
	skill.SetCheckCoolDown(1, 444);
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	if dwSkillLevel <= 4 then
		skill.nCostManaBasePercent = 674 * 0.2 * 0.9 * 0.8;	-- �������ĵ�����
	elseif dwSkillLevel <= 8 then
		skill.nCostManaBasePercent = 674 * 0.4 * 0.9 * 0.8;	-- �������ĵ�����
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 674 * 0.6 * 0.9 * 0.8;	-- �������ĵ�����
	elseif dwSkillLevel <= 16 then
		skill.nCostManaBasePercent = 674 * 0.8 * 0.9 * 0.8;	-- �������ĵ�����
	else
		skill.nCostManaBasePercent = 674 * 0.9 * 0.8;	-- �������ĵ�����
	end
	----------------- ����������� ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	skill.nChainBranch = 2;					--��״���ܷ�֧��
	skill.nChainDepth = 1;					--��״���ܲ���

	--skill.nWeaponDamagePercent	= 2048;
	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = 20 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 128; 										--ʩ�ŽǶ�,ȫ��256
	skill.nAreaRadius = 8 * LENGTH_BASE;		-- �������ð뾶
	--skill.nPrepareFrames    = 24;										--����֡��,16֡����1��
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 80 * 1.1 * 1.1;
	elseif dwSkillLevel < 18 then
		skill.nChannelInterval = (80 + (dwSkillLevel - 9) * 15) * 1.1 * 1.1
	else
		skill.nChannelInterval = 220 * 1.1 * 1.1;     -- ͨ�������ʱ��
	end
	--skill.nBreakRate	= 1024;									--���ʩ������

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
		if stackNum < 7  then
			return false
		end
	end
	if player.GetBuff(409, nLevel + 7) then
		local	nBuff = player.GetBuff(409, nLevel + 7)
		local   stackNum = nBuff.nStackNum
		if stackNum < 7  then
			return false
		end
	end
	if player.GetBuff(409, nLevel + 14) then
		local	nBuff = player.GetBuff(409, nLevel + 14)
		local   stackNum = nBuff.nStackNum
		if stackNum < 7  then
			return false
		end
	end

	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--[[
	if player.GetBuff(1383, 2) or player.GetBuff(8528,1) then
		for i = 1, 6 do
			player.CastSkill(6213, 1)
		end
	end
	--]]
	local nLevel = player.GetSkillLevel(537)
	if not nLevel then
		return
	end
	if not player.GetBuff(1383, 2) and not player.GetBuff(8528, 1) then
		for i = 1, 6 do
			player.DelBuff(409, nLevel + 7)
			player.DelBuff(409, nLevel + 14)
			player.DelBuff(409, nLevel)
		end
	end
	--[[
	if player.GetSkillLevel(6571) == 1 then
		if not player.GetBuff(6421, 1) then
			if player.GetBuff(409, nLevel) and player.GetBuff(409, nLevel).nStackNum <= 1 then
				for i = 1, 10 do
					player.AddBuff(player.dwID, player.nLevel, 409, nLevel)
				end
				player.AddBuff(0, 99, 6432, 1)
				player.AddBuff(0, 99, 6421, 1)  -- ����CD
			end
			if player.GetBuff(409, nLevel + 7) and player.GetBuff(409, nLevel + 7).nStackNum <= 1 then
				for i = 1, 10 do
					player.AddBuff(player.dwID, player.nLevel, 409, nLevel + 7)
				end
				player.AddBuff(0, 99, 6432, 1)
				player.AddBuff(0, 99, 6421, 1)
			end
			if player.GetBuff(409, nLevel + 14) and player.GetBuff(409, nLevel + 14).nStackNum <= 1 then
				for i = 1, 10 do
					player.AddBuff(player.dwID, player.nLevel, 409, nLevel + 14)
				end
				player.AddBuff(0, 99, 6432, 1)
				player.AddBuff(0, 99, 6421, 1)
			end
			player.AddBuff(dwCharacterID, player.nLevel, 5865, 1, 1)
			player.AddBuff(dwCharacterID, player.nLevel, 5866, 1, 1)
		end
	end
	--]]
	local lv = player.GetSkillLevel(2707)
	if player.GetSkillLevel(5868) == 1 then
		player.CastSkill(6207, lv)
		player.CastSkill(9346, lv)
	end

	local target = player.GetSelectCharacter()
	if not target then
		return
	end
	if target.nCurrentLife <= target.nMaxLife * 0.5 then
		if player.GetSkillLevel(6561) == 1 then
			--[[
			if not player.GetBuff(7619, 1) then
				player.AddBuff(dwCharacterID, player.nLevel, 6418, 1, 1)
				player.AddBuff(dwCharacterID, player.nLevel, 7619, 1, 1)
			end
			--]]
			player.AddBuff(dwCharacterID, player.nLevel, 6418, 1, 1)
		end
	end
	if player.GetBuff(1917, 3) or player.GetBuff(1917, 4) then --90������
		player.AddBuff(dwCharacterID, player.nLevel, 6469, 1, 1)
	end

	--С�ӵ����Ʒ�
	if player.GetSkillLevel(14713) == 1 then
		player.CastSkill(14714, 1)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
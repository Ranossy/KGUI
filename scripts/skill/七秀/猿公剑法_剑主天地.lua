---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/Գ������_�������.lua
-- ����ʱ��:	2017/3/15 18:15:49
-- �����û�:	chenchen6-pc
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ����_�����¼�_֪����.lua
-- ������    :  kingbeyond
-- ����ʱ��  :  2007-12-11
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  �����¼�
-- ��������  :  ֪����
-- ����Ч��  :  ֪���ε��¼����ܣ�����ʱ�������Թ������ͷ�һ���˺�����
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nLunarDamage = 80 * 0.95, nLunarDamageRand = 68 * 0.1, nCostMana = 62 },
	{nLunarDamage = 90 * 0.95, nLunarDamageRand = 77 * 0.1, nCostMana = 68 },
	{nLunarDamage = 100 * 0.95, nLunarDamageRand = 86 * 0.1, nCostMana = 74 },
	{nLunarDamage = 110 * 0.95, nLunarDamageRand = 95 * 0.1, nCostMana = 80 },
	{nLunarDamage = 115 * 0.95, nLunarDamageRand = 104 * 0.1, nCostMana = 86 },
	{nLunarDamage = 120 * 0.95, nLunarDamageRand = 113 * 0.1, nCostMana = 92 },
	{nLunarDamage = 125 * 0.95, nLunarDamageRand = 122 * 0.1, nCostMana = 98},
	{nLunarDamage = 131 * 0.95, nLunarDamageRand = 131 * 0.1, nCostMana = 104},
	{nLunarDamage = 140 * 0.95, nLunarDamageRand = 140 * 0.1, nCostMana = 110},
	{nLunarDamage = 149 * 0.95, nLunarDamageRand = 149 * 0.1, nCostMana = 116},
	{nLunarDamage = 158 * 0.95, nLunarDamageRand = 158 * 0.1, nCostMana = 122},
	{nLunarDamage = 167 * 0.95, nLunarDamageRand = 167 * 0.1, nCostMana = 128},
	{nLunarDamage = 176 * 0.95, nLunarDamageRand = 176 * 0.1, nCostMana = 62 },
	{nLunarDamage = 185 * 0.95, nLunarDamageRand = 185 * 0.1, nCostMana = 68 },
	{nLunarDamage = 194 * 0.95, nLunarDamageRand = 194 * 0.1, nCostMana = 74 },
	{nLunarDamage = 203 * 0.95, nLunarDamageRand = 203 * 0.1, nCostMana = 80 },
	{nLunarDamage = 212 * 0.95, nLunarDamageRand = 212 * 0.1, nCostMana = 86 },
	{nLunarDamage = 221 * 0.95, nLunarDamageRand = 221 * 0.1, nCostMana = 92 },
	{nLunarDamage = 230 * 0.95, nLunarDamageRand = 230 * 0.1, nCostMana = 98},
	{nLunarDamage = 239 * 0.95, nLunarDamageRand = 239 * 0.1, nCostMana = 104},
	{nLunarDamage = 248 * 0.95, nLunarDamageRand = 248 * 0.1, nCostMana = 110},
	{nLunarDamage = 257 * 0.95, nLunarDamageRand = 257 * 0.1, nCostMana = 116},
	{nLunarDamage = 266 * 0.95, nLunarDamageRand = 266 * 0.1, nCostMana = 122},
	{nLunarDamage = 275 * 0.95, nLunarDamageRand = 275 * 0.1, nCostMana = 128},
	{nLunarDamage = 284 * 0.95, nLunarDamageRand = 284 * 0.1, nCostMana = 62 },
	{nLunarDamage = 293 * 0.95, nLunarDamageRand = 293 * 0.1, nCostMana = 68 },
	{nLunarDamage = 302 * 0.95, nLunarDamageRand = 302 * 0.1, nCostMana = 74 },
	{nLunarDamage = 311 * 0.95, nLunarDamageRand = 311 * 0.1, nCostMana = 80 },
	{nLunarDamage = 320 * 0.95, nLunarDamageRand = 320 * 0.1, nCostMana = 86 },
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE,
		tSkillData[dwSkillLevel].nLunarDamage / 2,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nLunarDamageRand / 2,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_LUNAR_DAMAGE,
		0,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/����/Գ������_�������.lua", --����ֵ1
		0															--����ֵ2
	);
	--for i = 1, 3 do
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	--ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
	--"skill/����/�����ķ�_ȥ������.lua",
	--0
	--);
	--[[
	skill.AddAttribute(
	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
	ATTRIBUTE_TYPE.ACCUMULATE, -- ħ������
	1, -- ����ֵ1
	0														-- ����ֵ2
	);
	--]]
	--skill.AddAttribute(														--70���似��
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
	--ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
	--6213,
	--1
	--);

	--end

	--skill.BindBuff(1, 523, 1)--����BUFF��12��

	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);	--����CD1.5��
	skill.SetNormalCoolDown(1, 191);	--����CD1.5��
	skill.SetCheckCoolDown(1, 444);
	skill.AddSlowCheckSelfBuff(409, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL)   --������BUFF

	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 270 * 0.2 * 0.9;	-- �������ĵ�����
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 270 * 0.4 * 0.9;	-- �������ĵ�����
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 270 * 0.6 * 0.9;	-- �������ĵ�����
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 270 * 0.8 * 0.9;	-- �������ĵ�����
	else
		skill.nCostManaBasePercent = 270 * 0.9;	-- �������ĵ�����
	end
	--------------- ����������� ----------------------------------------------------------------------

	-- skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	-- skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = 20 * LENGTH_BASE;						--����ʩ�����뾶
	skill.nAngleRange = 128; 									--ʩ�ŽǶ�

	skill.nPrepareFrames = 0;										--����֡��,16֡����1��

	if dwSkillLevel < 10 then
		skill.nChannelInterval = 36 * 1.5;
	elseif dwSkillLevel < 29 then
		skill.nChannelInterval = (36 + (dwSkillLevel - 9) * 3) * 1.5
	else
		skill.nChannelInterval = 96 * 1.5;     -- ͨ�������ʱ��
	end

	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡

	--skill.nBreakRate        = 1024;									--����ϵĸ���,Ĭ��1024��ʾһ�������

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
end
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

	--����Ч��
	--[[
	if player.GetSkillLevel(5857) == 1 then
		if player.IsSkillRecipeActive(153, 1) then
			--65%Ч��
			target.AddBuff(player.dwID, player.nLevel, 9777, 4)
		else
			--55%Ч��
			target.AddBuff(player.dwID, player.nLevel, 9777, 2)
		end
	else
	--]]
	if player.IsSkillRecipeActive(153, 1) then
		target.AddBuff(player.dwID, player.nLevel, 9777, 4)  		--65%����Ч��

		--������ػظ�����
		for i = 1, 3 do
			player.CastSkill(13438, 1)
		end
	else
		--50%����Ч��
		target.AddBuff(player.dwID, player.nLevel, 9777, 1)
	end

	--����Ч��
	if player.GetSkillLevel(6848) == 1 then
		target.AddBuff(dwSkillSrcID, player.nLevel, 5793, 1, 1)
	end
	--[[if player.GetSkillLevel(6847) == 1 then
		player.CastSkill(3016, 1)
		player.CastSkill(3016, 1)
		player.AddBuff(dwSkillSrcID,player.nLevel,6384,1,1)
	end--]]

	--[[������ػظ�����
	if player.GetSkillLevel(5857) == 1 then
		for i = 1, 3 do
			player.CastSkill(13438, 1)
		end
	end
	--]]

	--[[С�ӵ����Ʒ�
	if player.GetSkillLevel(14713) == 1 then
		player.CastSkill(14714, 1)
	end
--]]
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
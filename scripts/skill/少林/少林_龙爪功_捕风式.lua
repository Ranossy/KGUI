---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����_��צ��_����ʽ.lua
-- ����ʱ��:	2015/9/28 14:32:00
-- �����û�:	mengxiangfei11
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--���ӳ���ݶ��ͼ����˺����
tSkillData =
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 49, nDamageRand = 5}, -- Level 1
	{nAddRage = 0, nCostRage = 10, nDamageBase = 55, nDamageRand = 6}, -- Level 2
	{nAddRage = 0, nCostRage = 10, nDamageBase = 61, nDamageRand = 7}, -- Level 3
	{nAddRage = 0, nCostRage = 10, nDamageBase = 67, nDamageRand = 7}, -- Level 4
	{nAddRage = 0, nCostRage = 10, nDamageBase = 73, nDamageRand = 8}, -- Level 5
	{nAddRage = 0, nCostRage = 10, nDamageBase = 79, nDamageRand = 9}, -- Level 6
	{nAddRage = 0, nCostRage = 10, nDamageBase = 85, nDamageRand = 9}, -- Level 7
	{nAddRage = 0, nCostRage = 10, nDamageBase = 91, nDamageRand = 10}, -- Level 8
	{nAddRage = 0, nCostRage = 10, nDamageBase = 97, nDamageRand = 10}, -- Level 9
	{nAddRage = 0, nCostRage = 10, nDamageBase = 103, nDamageRand = 11}, -- Level 10
	{nAddRage = 0, nCostRage = 10, nDamageBase = 109, nDamageRand = 12}, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 115, nDamageRand = 12}, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 121, nDamageRand = 13}, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 127, nDamageRand = 14}, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 133, nDamageRand = 14}, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 139, nDamageRand = 15}, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 145, nDamageRand = 15}, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 151, nDamageRand = 16}, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 157, nDamageRand = 17}, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 163, nDamageRand = 17}, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 169, nDamageRand = 18}, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 175, nDamageRand = 18}, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamageBase = 181, nDamageRand = 19}, -- Level 23
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase / 3,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand / 3,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_SOLAR_DAMAGE,
		0,
		0
	);
--��һ�㷴��ֵ
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.ACCUMULATE,
		1,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		854,
		1
	);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/����/����_��צ��_����ʽ.lua", -- ����ֵ1
		0														-- ����ֵ2
	);
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);		--����CD1��
	skill.SetNormalCoolDown(1, 73);
	skill.SetCheckCoolDown(1, 444);
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	if dwSkillLevel <= 5 then
		skill.nCostManaBasePercent = 263 * 0.2;	-- �������ĵ�����
	elseif dwSkillLevel <= 10 then
		skill.nCostManaBasePercent = 263 * 0.4;
	elseif dwSkillLevel <= 15 then
		skill.nCostManaBasePercent = 263 * 0.6;
	elseif dwSkillLevel <= 20 then
		skill.nCostManaBasePercent = 263 * 0.8;
	else
		skill.nCostManaBasePercent = 263;
	end
	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	--skill.nChannelInterval	= 15; 				-- ͨ�������ʱ��
	--skill.nChannelInterval		= 48;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡

	----------------- ������ -------------------------------------------------
	--skill.nBrokenRate      = 0 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
	--skill.nBreakRate		= 0;					-- ���Ŀ��ʩ���ĸ���,����1024

	----------------- ����������� ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = 20 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 128; 										--ʩ�ŽǶ�,ȫ��256
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��
	skill.nWeaponDamagePercent = 0;
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 36;
	elseif dwSkillLevel < 23 then
		skill.nChannelInterval = 36 + (dwSkillLevel - 9) * 2
	else
		skill.nChannelInterval = 77;     -- ͨ�������ʱ��
	end

	--skill.nChannelInterval = 77;
	skill.nBreakRate = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������

	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(3828)
	end
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

	local nlev = player.GetSkillLevel(238)
	
	if nlev ~= 0 then
		--[[
		if player.GetSkillLevel(14750) == 1 then
			local nLifeSelf = player.nCurrentLife / player.nMaxLife
			local nLifeDst = target.nCurrentLife / target.nMaxLife
			if nLifeSelf >= nLifeDst then
				player.CastSkill(14953, nlev, player.GetSkillTarget())	--Ŀ����Ѫ���Լ��ͣ�����100%��(����100%��10����)
			else
				player.CastSkill(14951, nlev, player.GetSkillTarget())	--��Ѫ�Ա��ޱ仯��(�����˺�)
			end
		else
			player.CastSkill(14951, nlev, player.GetSkillTarget())	--��Ѫ�Ա��ޱ仯��(�����˺�)
		end
		--]]
		player.CastSkill(14951, nlev, player.GetSkillTarget())
	end
	
	--[[
	if player.GetSkillLevel(6593) == 1 then
		if target.nCurrentLife <= 0.3 * target.nMaxLife then
			if player.GetCDLeft(49) ~= 0 and (not player.GetBuff(6197, 1)) then
				player.ClearCDTime(49)
				player.AddBuff(dwCharacterID, player.nLevel, 6197, 1, 1)
			end
		end
	end
	--]]
	--[[
	if player.GetSkillLevel(5911) == 1 then
		--player.CastSkill(6667, 1)
	end
	--]]
	--[[
	--������Ѫ�ٷֱȱ��Լ��͵����ӻ���
	if player.GetSkillLevel(14750) == 1 then
		local nLifeSelf = player.nCurrentLife / player.nMaxLife
		local nLifeDst = target.nCurrentLife / target.nMaxLife
		if nLifeSelf >= nLifeDst then
			for i = 1, 3 do
				player.AddBuff(player.dwID, player.nLevel, 9802, 1)
			end
		end
	end
	--]]
	--[[
	--�����ڼ�׽Ӱʽʩչ�������5��
	if player.GetSkillLevel(5897) == 1 then
		player.AddBuff(player.dwID, player.nLevel, 9813, 1)
	end
	--]]
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
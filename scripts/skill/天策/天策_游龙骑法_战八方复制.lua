---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/���_�����﷨_ս�˷�����.lua
-- ����ʱ��:	2015/9/21 20:35:02
-- �����û�:	mengxiangfei11
-- �ű�˵��:

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 10, nDamage = 35 * 0.5, nDamageRand = 35 * 0.1, }, -- Level 1
	{nAddRage = 0, nCostRage = 10, nDamage = 41 * 0.5, nDamageRand = 41 * 0.1, }, -- Level 2
	{nAddRage = 0, nCostRage = 10, nDamage = 46 * 0.5, nDamageRand = 46 * 0.1, }, -- Level 3
	{nAddRage = 0, nCostRage = 10, nDamage = 51 * 0.5, nDamageRand = 51 * 0.1, }, -- Level 4
	{nAddRage = 0, nCostRage = 10, nDamage = 56 * 0.5, nDamageRand = 56 * 0.1, }, -- Level 5
	{nAddRage = 0, nCostRage = 10, nDamage = 61 * 0.5, nDamageRand = 61 * 0.1, }, -- Level 6
	{nAddRage = 0, nCostRage = 10, nDamage = 67 * 0.5, nDamageRand = 67 * 0.1, }, -- Level 7
	{nAddRage = 0, nCostRage = 10, nDamage = 72 * 0.5, nDamageRand = 72 * 0.1, }, -- Level 8
	{nAddRage = 0, nCostRage = 10, nDamage = 77 * 0.5, nDamageRand = 77 * 0.1, }, -- Level 9
	{nAddRage = 0, nCostRage = 10, nDamage = 82 * 0.5, nDamageRand = 82 * 0.1, }, -- Level 10
	{nAddRage = 0, nCostRage = 10, nDamage = 87 * 0.5, nDamageRand = 87 * 0.1, }, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamage = 93 * 0.5, nDamageRand = 93 * 0.1, }, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamage = 98 * 0.5, nDamageRand = 98 * 0.1, }, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamage = 103 * 0.5, nDamageRand = 103 * 0.1, }, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamage = 108 * 0.5, nDamageRand = 108 * 0.1, }, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamage = 113 * 0.5, nDamageRand = 113 * 0.1, }, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamage = 119 * 0.5, nDamageRand = 119 * 0.1, }, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamage = 124 * 0.5, nDamageRand = 124 * 0.1, }, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamage = 129 * 0.5, nDamageRand = 129 * 0.1, }, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamage = 134 * 0.5, nDamageRand = 134 * 0.1, }, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamage = 139 * 0.5, nDamageRand = 139 * 0.1, }, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamage = 145 * 0.5, nDamageRand = 145 * 0.1, }, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamage = 150 * 0.5, nDamageRand = 150 * 0.1, }, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamage = 155 * 0.5, nDamageRand = 155 * 0.1, }, -- Level 24
	{nAddRage = 0, nCostRage = 10, nDamage = 160 * 0.5, nDamageRand = 160 * 0.1, }, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamage = 165 * 0.5, nDamageRand = 165 * 0.1, }, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamage = 171 * 0.5, nDamageRand = 171 * 0.1, }, -- Level 27
	{nAddRage = 0, nCostRage = 10, nDamage = 176 * 0.5, nDamageRand = 176 * 0.1, }, -- Level 28
	{nAddRage = 0, nCostRage = 10, nDamage = 181 * 0.5, nDamageRand = 181 * 0.1, }, -- Level 29
};

tPit =
{
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
}
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamage * (1 - tPit[dwSkillLevel].nReducePercent),
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand * (1 - tPit[dwSkillLevel].nReducePercent),
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
		);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/���/���_�����﷨_ս�˷�����.lua",
		0
		);	

	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);		--����CD1��
	skill.SetNormalCoolDown(1, 104);	-- 2008��5��23�ոİ棬��Ϊ��CD
	skill.SetCheckCoolDown(1, 444)
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	--skill.nCostManaBasePercent = 545;	-- �������ĵ�����
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 545 * 0.2;	-- �������ĵ�����
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 545 * 0.4;
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 545 * 0.6;
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 545 * 0.8;
	else
		skill.nCostManaBasePercent = 545;
	end
	----------------- ����������� ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nWeaponDamagePercent = 1024;

	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = MELEE_ATTACK_DISTANCE;							--����ʩ�����뾶
	skill.nAngleRange = 256; 										--ʩ�ŽǶ�,ȫ��256

	skill.nAreaRadius = 6 * LENGTH_BASE;	-- 2008��5��23����8�׸�Ϊ6��

	skill.nPrepareFrames = 0;										--����֡��,16֡����1��
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 32;
	elseif dwSkillLevel < 29 then
		skill.nChannelInterval = 32 + (dwSkillLevel - 9) * 3
	else
		skill.nChannelInterval = 100;     -- ͨ�������ʱ��
	end
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡

	skill.nBreakRate = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������

	skill.nTargetCountLimit = 5;

	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)
	if nPreResult == SKILL_RESULT_CODE.SUCCESS then
		if	player.GetBuff(9869, 1) then
			player.DelGroupBuff(9869, 1)
		end
	end
	if player.GetSkillLevel(5669) == 1 then
		return nPreResult;
	else
		return false
	end
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	player.CastSkill(14883, 1)	--����Ŀ�������ж�����

	local nbuff = player.GetBuff(9869, 1)
	local nbuff_count = 0
	if nbuff then
		nbuff_count = nbuff.nStackNum
	end
	print("nbuff_count"..nbuff_count)
	local nlev = player.GetSkillLevel(6520)	--����ս�˷�
	if nlev ~= 0 then
		--[[
		if player.GetSkillLevel(14821) == 1 then
			if nbuff_count > 1 then
				print(111)
				player.CastSkill(14884, nlev)	--����Ѩ�����˵�AOE
			else
				if player.GetSkillLevel(14825) == 1 then
					print(222)
					player.CastSkill(14885, nlev)	--����Ѩ���²е�AOE,�˺�����
				else
					print(333)
					player.CastSkill(14886, nlev)	--����Ѩ���²е�AOE�������˺�
				end
			end
		else
			--]]
		if player.GetSkillLevel(14825) == 1 then
			if nbuff_count > 1 then
				--print(444)
				player.CastSkill(14887,nlev)	--�����˺�AOE,�����������²�
			else
				--print(555)
				player.CastSkill(14888,nlev)	--�����˺�AOE,��������
			end
		else
			--print(666)
			player.CastSkill(14887,nlev)	--�����˺�AOE,�����������²�
		end
		--end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
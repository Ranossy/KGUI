---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/���_�Ӽ���_��_�˺�ѣ��.lua
-- ����ʱ��:	2015/9/19 23:56:15
-- �����û�:	mengxiangfei11
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ���_�Ӽ���_��_�˺�ѣ��.lua
-- ������    :  ����
-- ����ʱ��  :  2008-3-7
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  ����Ṧ
-- ��������  :  ����ͻ
-- ����Ч��  :  ��ǰ���һ�ξ��룬ͬʱ���н�·���ϵĵ�������˺�������ѣ��Ч��
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamage = 10, nDamageRand = 5 },
	{nDamage = 13, nDamageRand = 5 },
	{nDamage = 16, nDamageRand = 5 },
	{nDamage = 19, nDamageRand = 5 },
	{nDamage = 22, nDamageRand = 5 },
	{nDamage = 25, nDamageRand = 5 }
};
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	local bRetCode = false;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamage,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/���/���_�Ӽ���_��_�˺�ѣ��.lua",
		0
	);

	----------------- ����Cool down ---------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetNormalCoolDown(1, 8);

	----------------- ����������� ----------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 25 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	skill.nHeight = 6 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	skill.nRectWidth = 6 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	skill.nAreaRadius = 25 * LENGTH_BASE;		-- �������ð뾶
	skill.nTargetCountLimit = 5;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)
	--�����뾶��Ҳ���ǹ�������Ч����

	--����֡��
	skill.nPrepareFrames = 0;
	--�ӵ��ٶ�
	skill.nBulletVelocity = 0;
	--����ϵĸ���
	skill.nBreakRate = 0;
	skill.nLeastFormationPopulation = 5;
	skill.nWeaponDamagePercent = 0;
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
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end

	if player.GetSkillLevel(5685) == 1 then
		player.nCurrentLife = player.nCurrentLife + player.nMaxLife * 0.05
	end

	if player.GetSkillLevel(14826) == 1 then
		if IsPlayer(dwCharacterID) then
			player.CastSkill(406, 1, TARGET.PLAYER, dwCharacterID)
			player.CastSkill(438, 1, TARGET.PLAYER, dwCharacterID)

			player.CastSkill(406, 1, TARGET.PLAYER, dwCharacterID)
			player.CastSkill(438, 1, TARGET.PLAYER, dwCharacterID)
		else
			player.CastSkill(406, 1, TARGET.NPC, dwCharacterID)
			player.CastSkill(438, 1, TARGET.NPC, dwCharacterID)

			player.CastSkill(406, 1, TARGET.NPC, dwCharacterID)
			player.CastSkill(438, 1, TARGET.NPC, dwCharacterID)
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
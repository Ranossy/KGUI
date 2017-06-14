---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/���_����ǹ��_����.lua
-- ����ʱ��:	2015/6/15 21:18:31
-- �����û�:	XIAXIANBO
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ���_����ǹ��_����.lua
-- ������    :  �ź�
-- ����ʱ��  :  2011-04-11
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  ����ǹ��
-- ��������  :  ����
-- ����Ч��  :  ǿ����նɱ
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamage = 214 * 0.95, nDamageRand = 214 * 0.1, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 232 * 0.95, nDamageRand = 232 * 0.1, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 250 * 0.95, nDamageRand = 250 * 0.1, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 268 * 0.95, nDamageRand = 268 * 0.1, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 286 * 0.95, nDamageRand = 286 * 0.1, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 304 * 0.95, nDamageRand = 304 * 0.1, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 322 * 0.95, nDamageRand = 322 * 0.1, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 340 * 0.95, nDamageRand = 340 * 0.1, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 358 * 0.95, nDamageRand = 358 * 0.1, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 376 * 0.95, nDamageRand = 376 * 0.1, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 394 * 0.95, nDamageRand = 394 * 0.1, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 412 * 0.95, nDamageRand = 412 * 0.1, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
	{nDamage = 430 * 0.95, nDamageRand = 430 * 0.1, nLevel = 1, nCostMana = 57, nDebuffLevel = 1},
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	skill.SetSubsectionSkill(1, 1, 2917, 13);
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
		"skill/���/���_����ǹ��_����.lua",
		0
	);

	--skill.BindBuff(1, 2774, 1);

	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);		--����CD1��
	skill.SetNormalCoolDown(1, 437);
	skill.SetCheckCoolDown(1, 444)
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	skill.nCostManaBasePercent = 440;	-- �������ĵ�����
	----------------- ����������� ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	skill.nChainBranch = 3;					--��״���ܷ�֧��
	skill.nChainDepth = 1;					--��״���ܲ���

	skill.nWeaponDamagePercent = 2048;
	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = 4 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 128; 										--ʩ�ŽǶ�,ȫ��256
	skill.nAreaRadius = 4 * LENGTH_BASE;		-- �������ð뾶
	--skill.nPrepareFrames    = 24;										--����֡��,16֡����1��
	skill.nChannelInterval = 224;     -- ͨ�������ʱ��
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡
	--skill.nBreakRate	= 1024;									--���ʩ������

	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end


function Apply(dwCharacterID, dwSkillSrcID)
	--print(111)
	--[[
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.IsSkillRecipeActive(1556,1) then
	   player.AddBuff(0,99,2774,1,15)
	else
	   player.AddBuff(0,99,2774,1,10)
	end
	--]]
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
	if player.IsSkillRecipeActive(1556,1) then
	   target.AddBuff(0,99,2774,1,12)
	else
	   target.AddBuff(0,99,2774,1,10)
	end	
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
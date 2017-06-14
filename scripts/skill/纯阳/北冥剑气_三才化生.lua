---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��ڤ����_���Ż���.lua
-- ����ʱ��:	2013/4/19 10:38:59
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ��ڤ����_���Ż���.lua
-- ������    :  kingbeyond	
-- ����ʱ��  :  2007-12-11
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  ��ڤ����
-- ��������  :  ���Ż���
-- ����Ч��  :  ʩ������ΧAOE
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 10, nDamageBase = 80, 	nDamageRand = 5}, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 120, 	nDamageRand = 8}, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 160, 	nDamageRand = 12}, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 180, 	nDamageRand = 15}, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 185, 	nDamageRand = 19}, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 220, 	nDamageRand = 22}, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 255, 	nDamageRand = 26}, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 290, 	nDamageRand = 29}, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 325, 	nDamageRand = 33}, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 360, 	nDamageRand = 36}, -- Level 10 
	{nAddRage = 0, nCostRage = 10, nDamageBase = 395, 	nDamageRand = 40}, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamageBase = 430, 	nDamageRand = 43}, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamageBase = 465, 	nDamageRand = 47}, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamageBase = 500, 	nDamageRand = 50}, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamageBase = 535, 	nDamageRand = 54}, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamageBase = 570, 	nDamageRand = 57}, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamageBase = 605, 	nDamageRand = 61}, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamageBase = 640, 	nDamageRand = 64}, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamageBase = 675, 	nDamageRand = 68}, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamageBase = 710, 	nDamageRand = 71}, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamageBase = 745, 	nDamageRand = 75}, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamageBase = 780, 	nDamageRand = 78}, -- Level 22
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel
	
	--skill.bIsAccumulate = true;
	--skill.SetSubsectionSkill(1, 1, 327, dwSkillLevel);   --��һ��
	--skill.SetSubsectionSkill(2, 2, 328, dwSkillLevel);		--�ڶ���
	--skill.SetSubsectionSkill(3, 3, 329, dwSkillLevel);		--������
	--skill.SetSubsectionSkill(4, 4, 330, dwSkillLevel);   --��һ��
	--skill.SetSubsectionSkill(5, 5, 331, dwSkillLevel);		--�ڶ���
	--skill.SetSubsectionSkill(6, 6, 461, dwSkillLevel);		--������
	--skill.SetSubsectionSkill(7, 7, 462, dwSkillLevel);   	--��һ��
	--skill.SetSubsectionSkill(8, 8, 463, dwSkillLevel);		--�ڶ���
	--skill.SetSubsectionSkill(9, 9, 464, dwSkillLevel);		--������
	--skill.SetSubsectionSkill(10, 10, 465, dwSkillLevel);	--������
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/��ڤ����_���Ż���.lua", -- ��Э��
		0
	);	 	 
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE, -- ��Ԫ�˺�
		tSkillData[dwSkillLevel].nDamageBase*0.1, -- ����ֵ1
		0																-- ����ֵ2
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE_RAND, -- ��Ԫ�˺�����ֵ
		tSkillData[dwSkillLevel].nDamageRand*0.1, -- ����ֵ1
		0																-- ����ֵ2
	);
   		
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.CALL_NEUTRAL_DAMAGE, -- Call��Ԫ�˺�
		0, -- ����ֵ1
		0																-- ����ֵ2
	);	
	
	
	skill.BindBuff(1, 1937, 5);
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);	--����CD
	skill.SetNormalCoolDown(1, 182);	--12��
	--������λ
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	if dwSkillLevel <= 4 then
		skill.nCostManaBasePercent = 272*0.1;	-- �������ĵ�����
	elseif dwSkillLevel <= 8 then
		skill.nCostManaBasePercent = 272*0.2;	-- �������ĵ�����
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 272*0.4;	-- �������ĵ�����
	elseif dwSkillLevel <= 16 then
		skill.nCostManaBasePercent = 272*0.7;	-- �������ĵ�����
	else
		skill.nCostManaBasePercent = 272;	-- �������ĵ�����
	end
	skill.SetCheckCoolDown(1, 444)
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0									--����ʩ����С�뾶
	skill.nMaxRadius = 0;								--����ʩ�����뾶
	skill.nAngleRange = 256; 								--ʩ�ŽǶ�
	skill.nAreaRadius = 8 * LENGTH_BASE;					--�������ð뾶
	skill.nTargetCountLimit = 6;
    
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��
    
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡
    
	skill.nBrokenRate = 1024;									--����ϵĸ���,Ĭ��1024��ʾһ�������
    
	return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

function OnSkillLevelUp(skill, player)
end
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--local lv = player.GetSkillLevel(301)
	if player.GetSkillLevel(5835) == 1 then
		player.CastSkill(336, 1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
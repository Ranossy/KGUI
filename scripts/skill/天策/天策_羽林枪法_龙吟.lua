---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/���_����ǹ��_����.lua
-- ����ʱ��:	2013/5/28 23:32:02
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ���_����ǹ��_����.lua
-- ������    :  ����
-- �޸�ʱ��  �� 2008-06-04 
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  ����ǹ��
-- ��������  :  ����
-- ����Ч��  :  ʹ������˺�����ʱ10%�����˵�Ч��,ʹ�ú���ʩ������,������50%���ʸ�������Ч��.
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 10, nDamage = 39, 	nDamageRand = 5, }, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamage = 50, 	nDamageRand = 5, }, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamage = 55, 	nDamageRand = 5, }, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamage = 65, 	nDamageRand = 5, }, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamage = 70, 	nDamageRand = 5, }, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamage = 72, 	nDamageRand = 5, }, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamage = 73, 	nDamageRand = 5, }, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamage = 75, 	nDamageRand = 5, }, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamage = 77, 	nDamageRand = 5, }, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamage = 80, 	nDamageRand = 5, }, -- Level 10
	{nAddRage = 0, nCostRage = 10, nDamage = 85, 	nDamageRand = 10, }, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamage = 90, 	nDamageRand = 10, }, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamage = 95, 	nDamageRand = 10, }, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamage = 100, 	nDamageRand = 10, }, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamage = 105, 	nDamageRand = 10, }, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamage = 110, 	nDamageRand = 10, }, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamage = 115, 	nDamageRand = 10, }, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamage = 190*0.65, 	nDamageRand = 10, }, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamage = 199*0.65, 	nDamageRand = 10, }, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamage = 208*0.65, 	nDamageRand = 15, }, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamage = 217*0.65, 	nDamageRand = 15, }, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamage = 226*0.65, 	nDamageRand = 15, }, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamage = 235*0.65, 	nDamageRand = 15, }, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamage = 244*0.65, 	nDamageRand = 15, }, -- Level 24
	{nAddRage = 0, nCostRage = 10, nDamage = 253*0.65, 	nDamageRand = 15, }, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamage = 262*0.65, 	nDamageRand = 15, }, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamage = 271*0.65, 	nDamageRand = 15, }, -- Level 27
	{nAddRage = 0, nCostRage = 10, nDamage = 280*0.65, 	nDamageRand = 15, }, -- Level 28
	{nAddRage = 0, nCostRage = 10, nDamage = 289*0.65, 	nDamageRand = 15, }, -- Level 29
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;
	
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
--		429,
--		dwSkillLevel
--	);
--	
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
--		430,
--		dwSkillLevel
--	);
	
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
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/���/���_����ǹ��_����.lua", -- ����ֵ1
		0														-- ����ֵ2
	);
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);		--����CD1��
	skill.SetNormalCoolDown(1, 150);
	--skill.SetNormalCoolDown(2, 259);
	skill.SetCheckCoolDown(1, 444)
	----------------- ���ü������� ---------------------------------------------------------------------
	-- skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 167*0.2;	-- �������ĵ�����
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 167 * 0.4;	-- �������ĵ�����
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 167 * 0.6;
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 167 * 0.8;
	else
		skill.nCostManaBasePercent = 167;
	end
	----------------- ���ü���ʩ��buff���� ----------------------------------------------------------------------
	--skill.AddSlowCheckDestBuff(10226, 1, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
	--skill.AddSlowCheckSelfBuff(366, 1, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	
	skill.nWeaponDamagePercent = 1024;
	
	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = MELEE_ATTACK_DISTANCE;							--����ʩ�����뾶
	skill.nAngleRange = 128; 										--ʩ�ŽǶ�,ȫ��256
    
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��
    	
	if dwSkillLevel < 10 then
  		skill.nChannelInterval = 70;
 	elseif dwSkillLevel < 29 then
  		skill.nChannelInterval =70 + (dwSkillLevel - 9) * 5
  	else
  		skill.nChannelInterval =184;     -- ͨ�������ʱ��   
 	end
	
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡
    
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
		player.AcquireAchievement(36)
	end
	-- if player.IsAchievementAcquired(36) and player.IsAchievementAcquired(37) and player.IsAchievementAcquired(38) and player.IsAchievementAcquired(39) and player.IsAchievementAcquired(40) and player.IsAchievementAcquired(41) then
		-- player.AcquireAchievement(68)
	-- end
end
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	local target = player.GetSelectCharacter()
	if not target then
		return
	end

	--����ʹĿ�����Ч��
	if player.GetSkillLevel(5662) == 1 or player.GetSkillLevel(5681) == 1 then
		target.AddBuff(dwSkillSrcID, player.nLevel, 6130, 1, 1)
	end

	--�绢����3�ι����˺����20%
	if player.GetSkillLevel(5666) == 1 then
		--���ǰ��ɾ��֮ǰ�ı�Ǽ���buff
		if player.GetBuff(8837,1) then
			player.DelGroupBuff(8837, 1)
		end
		player.AddBuff(player.dwID, player.nLevel, 8835, 1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
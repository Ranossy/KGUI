------------------------------------------------
-- �ļ���    :  ���_����ǹ��_��.lua
-- ������    :  ����	
-- ����ʱ��  :  2008-03-05 
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  ����ǹ��
-- ��������  :  ��
-- ����Ч��  :  ����Ѫ������50%ʱ��,��Ŀ�����һ���⹦�˺�,����Ѫ��С��50%ʱ��,��Ŀ����ɼӱ��⹦�˺�.
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nCostMana = 81 , nDamage = 78 *0.95, nDamageRand = 78 *0.1, nDebuffLevel = 1},		-- Level 1
	{nCostMana = 103, nDamage = 99 *0.95, nDamageRand = 99 *0.1, nDebuffLevel = 1},		-- Level 2
	{nCostMana = 125, nDamage = 120*0.95, nDamageRand = 120*0.1, nDebuffLevel = 1},		-- Level 3
	{nCostMana = 147, nDamage = 141*0.95, nDamageRand = 141*0.1, nDebuffLevel = 1},		-- Level 4 
	{nCostMana = 169, nDamage = 162*0.95, nDamageRand = 162*0.1, nDebuffLevel = 1},		-- Level 5
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel;
	--ʩ�����_�Ӽ���_��_������ֵ
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		477,
		dwSkillLevel
	);
	--ʩ�����_�Ӽ���_��_������ֵ
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		476,
		dwSkillLevel
	);
	

	
--	skill.AddAttribute(
--        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
--        ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
--        tSkillData[dwSkillLevel].nDamage, 
--        0
--    );
--
--	skill.AddAttribute(
--        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
--        ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
--        tSkillData[dwSkillLevel].nDamageRand, 
--        0
--    );
--    
--    skill.AddAttribute(
--        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
--        ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
--        0, 
--        0
--    	);




    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    skill.SetPublicCoolDown(16);		--����CD1��
    skill.SetNormalCoolDown(1, 99);
	
	----------------- ���ü������� ---------------------------------------------------------------------
	skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	
	skill.nWeaponDamagePercent	= 1536;
	
    skill.nMinRadius		= 0											--����ʩ����С�뾶
    skill.nMaxRadius        = MELEE_ATTACK_DISTANCE;							--����ʩ�����뾶
    skill.nAngleRange       = 128; 										--ʩ�ŽǶ�,ȫ��256
    
    skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    
 	skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    
    skill.nBreakRate        = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
   
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
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
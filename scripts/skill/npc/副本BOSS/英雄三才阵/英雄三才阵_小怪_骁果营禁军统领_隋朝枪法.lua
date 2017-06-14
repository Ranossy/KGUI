------------------------------------------------
-- �ļ���    :  Ӣ��������_С��_���Ӫ����ͳ��_�峯ǹ��.lua
-- ������    :  ������
-- ����ʱ��  :  2009-5-13
-- ��;(ģ��):  ����
-- �书����  :  Ӣ��������_С��_���Ӫ����ͳ�켼��
-- �书����  :  
-- �书��·  :  
-- ��������  :  
-- ����Ч��  :  ��ÿ������Ŀ�����30%�������HP�˺�
----------------------�͵��ķָ���--------------------------

Include("scripts/Include/Skill.lh")                   
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 296  *0.8, nDamageRand = 296  *0.4, nCostMana = 0},		--level 1		  
	{nDamageBase = 502  *0.8, nDamageRand = 502  *0.4, nCostMana = 0},		--level 2		 
	{nDamageBase = 720  *0.8, nDamageRand = 720  *0.4, nCostMana = 0},		--level 3		
	{nDamageBase = 1048 *0.8, nDamageRand = 1048 *0.4, nCostMana = 0},		--level 4		
	{nDamageBase = 1376 *0.8, nDamageRand = 1376 *0.4, nCostMana = 0},		--level 5		
	{nDamageBase = 1893 *0.8, nDamageRand = 1893 *0.4, nCostMana = 0},		--level 6		
	{nDamageBase = 2257 *0.8, nDamageRand = 2257 *0.4, nCostMana = 0},		--level 7		
	{nDamageBase = 2621 *0.8, nDamageRand = 2621 *0.4, nCostMana = 0},		--level 8		
	{nDamageBase = 2985 *0.8, nDamageRand = 2985 *0.4, nCostMana = 0},		--level 9		
	{nDamageBase = 3349 *0.8, nDamageRand = 3349 *0.4, nCostMana = 0},		--level 10		
	{nDamageBase = 3713 *0.8, nDamageRand = 3713 *0.4, nCostMana = 0},		--level 11		
	{nDamageBase = 4078 *0.8, nDamageRand = 4078 *0.4, nCostMana = 0},		--level 12			                                           
	{nDamageBase = 4442 *0.8, nDamageRand = 4442 *0.4, nCostMana = 0},		--level 13		
	{nDamageBase = 4806 *0.8, nDamageRand = 4806 *0.4, nCostMana = 0},		--level 14		
	{nDamageBase = 5170 *0.8, nDamageRand = 5170 *0.4, nCostMana = 0},		--level 15	
	{nDamageBase = 5534 *0.8, nDamageRand = 5534 *0.4, nCostMana = 0},		--level 16		
	{nDamageBase = 5898 *0.8, nDamageRand = 5898 *0.4, nCostMana = 0},		--level 17		
	{nDamageBase = 6262 *0.8, nDamageRand = 6262 *0.4, nCostMana = 0},		--level 18		
	{nDamageBase = 6627 *0.8, nDamageRand = 6627 *0.4, nCostMana = 0},		--level 19		
	{nDamageBase = 6991 *0.8, nDamageRand = 6991 *0.4, nCostMana = 0},		--level 20		
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local bRetCode    = false;
	local dwSkillLevel	= skill.dwLevel
	
	
    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,				
        tSkillData[dwSkillLevel].nDamageBase * 0.14, 
        0
    );

	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
        tSkillData[dwSkillLevel].nDamageRand * 0.14, 
        0
    );

    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,  		
        0, 
        0
    );

    
    
	
    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    --skill.SetPublicCoolDown(16);	--����CD
	--skill.SetNormalCoolDown(1, 151);
	--������λ
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius	    	= 0											--����ʩ����С�뾶
    skill.nMaxRadius        = 8 * LENGTH_BASE;		  -- ����ʩ�ŵ�������
    skill.nAngleRange       = 256; 									--ʩ�ŽǶ�
    skill.nAreaRadius       = 8 * LENGTH_BASE;
	  skill.nTargetCountLimit	= 10;		--ʩ������
   -- skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    
 	--skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    --skill.nWeaponDamagePercent		= 0;
    --skill.nBreakRate        = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
	--skill.nTargetCountLimit	= 5;
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
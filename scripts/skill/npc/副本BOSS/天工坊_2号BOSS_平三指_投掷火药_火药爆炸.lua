------------------------------------------------
-- �ļ���    :  �칤��_2��BOSS_ƽ��ָ_Ͷ����ҩ.lua
-- ������    :  ���
-- ����ʱ��  :  2009-3-11
-- ��;(ģ��):  �书����

--����������	90                    
--ʩʩ�Ŵ���(�˴�Ĭ��45)	6         
--ԤԤ����������Ŀ�����	1         
--������ʱ��(˲��������2)	4         
--ʩʩ�ŽǶ�(ȫ�Ƕ�256)	256           
--AOAOE����Ŀ�����(��AOE������1)	5 
--AOAOE�뾶(���24,��AOE������24)	10
--BUBUFFԤ�����в���(ֱ���˺���1)	1 
--BUBUFFÿ�����(ֱ���˺���2)	2     
--BUBUFF����(ֱ���˺���1)	1         
--BUBUFF���ɵ��Ӳ���(ֱ���˺���1)	1 
--		                              
--		                              
--		                              
--����������˺��ٷֱ�	50%           
--�����γ���ʱ��	30.00             
--ԤԤ��ʩ�Ŵ���	1.00              
--���˺��ٷֱ�	48%                   ----
--�����屬����(��ͨ����Ϊ1)	0.81      
--AOAOE����	2.08                      ------------------------------
--���ۺϱ�����	1.68                  
--Inǿ��ϵ��	0.33                  
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 100*0.8*0.5, nDamageRand = 100*0.4*0.5, nCostMana = 38},		--level 1		0-4  
	{nDamageBase = 100*0.8*0.5, nDamageRand = 100*0.4*0.5, nCostMana = 38},		--level 2		5-9  
	{nDamageBase = 100*0.8*0.5, nDamageRand = 100*0.4*0.5, nCostMana = 38},		--level 3		10-14
	{nDamageBase = 100*0.8*0.5, nDamageRand = 100*0.4*0.5, nCostMana = 38},		--level 4		15-19
	{nDamageBase = 100*0.8*0.5, nDamageRand = 100*0.4*0.5, nCostMana = 38},		--level 5		20-24
	{nDamageBase = 100*0.8*0.5, nDamageRand = 100*0.4*0.5, nCostMana = 38},		--level 6		25-29
	{nDamageBase = 100*0.8*0.5, nDamageRand = 100*0.4*0.5, nCostMana = 38},		--level 7		30-34
	{nDamageBase = 100*0.8*0.5, nDamageRand = 100*0.4*0.5, nCostMana = 38},		--level 8		35-39
	{nDamageBase = 100*0.8*0.5, nDamageRand = 100*0.4*0.5, nCostMana = 38},		--level 9		40-44
	{nDamageBase = 100*0.8*0.5, nDamageRand = 100*0.4*0.5, nCostMana = 38},		--level 10		45-49
	{nDamageBase = 100*0.8*0.5, nDamageRand = 100*0.4*0.5, nCostMana = 38},		--level 11		50-54
	{nDamageBase = 100*0.8*0.5, nDamageRand = 100*0.4*0.5, nCostMana = 38},		--level 12		55-59	                                           
	{nDamageBase = 100*0.8*0.5, nDamageRand = 100*0.4*0.5, nCostMana = 38},		--level 13		60-64
	{nDamageBase = 100*0.8*0.5, nDamageRand = 100*0.4*0.5, nCostMana = 38},		--level 14		65-69
	{nDamageBase = 100*0.8*0.5, nDamageRand = 100*0.4*0.5, nCostMana = 38},		--level 15		70-74
	{nDamageBase = 100*0.8*0.5, nDamageRand = 100*0.4*0.5, nCostMana = 38},		--level 16		75-79
	{nDamageBase = 100*0.8*0.5, nDamageRand = 100*0.4*0.5, nCostMana = 38},		--level 17		80-84
	{nDamageBase = 100*0.8*0.5, nDamageRand = 100*0.4*0.5, nCostMana = 38},		--level 18		85-89
	{nDamageBase = 100*0.8*0.5, nDamageRand = 100*0.4*0.5, nCostMana = 38},		--level 19		90-94
	{nDamageBase = 100*0.8*0.5, nDamageRand = 100*0.4*0.5, nCostMana = 38},		--level 20		95-99
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local bRetCode     = false;
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
        ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,  				--35��BOSSǿ�ȣ��õڰ˼� 
        0, 
        0
    );
    
-- 	skill.AddAttribute(
-- 		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,						-- ��������ģʽ
 --		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,								-- ħ������
 --		844,												--����ֵ1
 --		dwSkillLevel										--����ֵ2
 --	);
--	skill.BindBuff(1,tSkillData[dwSkillLevel].nDebuffID, tSkillData[dwSkillLevel].nDebuffLevel)

    
    
	
    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    --skill.SetPublicCoolDown(16);	--����CD
	--skill.SetNormalCoolDown(1, 151);
	--������λ
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	----------------- ���˴��������� -------------------------------------------------
    skill.nBeatBackRate       = 0 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
    skill.nBrokenRate         = 0 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
    --skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024
	
	--Skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0
	
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

    skill.nMinRadius		= 0											--����ʩ����С�뾶
    skill.nMaxRadius        = 20 * LENGTH_BASE;		-- ����ʩ�ŵ�������
    skill.nAngleRange       = 256; 									--ʩ�ŽǶ�
    skill.nAreaRadius       = 10 * LENGTH_BASE;		-- �������ð뾶 

    --skill.nPrepareFrames    = 32;										--����֡��,16֡����1��
    
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
------------------------------------------------
-- �ļ���    :  �칤��_3��BOSS_�����ʿ_���.lua
-- ������    :  ���
-- ����ʱ��  :  2009-3-11
-- ��;(ģ��):  �书����

--��������	90                       
--ʩ�Ŵ���(�˴�Ĭ��45)	6            
--Ԥ����������Ŀ�����	1            
--����ʱ��(˲��������2)	2            
--ʩ�ŽǶ�(ȫ�Ƕ�256)	256          
--AOE����Ŀ�����(��AOE������1)	1    
--AOE�뾶(���24,��AOE������24)	24   
--BUFFԤ�����в���(ֱ���˺���1)	1    
--BUFFÿ�����(ֱ���˺���2)	2        
--BUFF����(ֱ���˺���1)	1            
--BUFF���ɵ��Ӳ���(ֱ���˺���1)	1
--	                                 
--	                                 
--	                                 
--��������˺��ٷֱ�	60%            
--���γ���ʱ��	30.00                
--Ԥ��ʩ�Ŵ���	1.00                 
--�˺��ٷֱ�	51%                    ------
--���屬����(��ͨ����Ϊ1)	0.92     
--AOE����	1.00                     ------------------------------
--�ۺϱ�����	0.92                   
--ǿ��ϵ��	0.40                     
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 100*0.8, nDamageRand = 100*0.4, nCostMana = 38},		--level 1		0-4  
	{nDamageBase = 100*0.8, nDamageRand = 100*0.4, nCostMana = 38},		--level 2		5-9  
	{nDamageBase = 100*0.8, nDamageRand = 100*0.4, nCostMana = 38},		--level 3		10-14
	{nDamageBase = 100*0.8, nDamageRand = 100*0.4, nCostMana = 38},		--level 4		15-19
	{nDamageBase = 100*0.8, nDamageRand = 100*0.4, nCostMana = 38},		--level 5		20-24
	{nDamageBase = 100*0.8, nDamageRand = 100*0.4, nCostMana = 38},		--level 6		25-29
	{nDamageBase = 100*0.8, nDamageRand = 100*0.4, nCostMana = 38},		--level 7		30-34
	{nDamageBase = 100*0.8, nDamageRand = 100*0.4, nCostMana = 38},		--level 8		35-39
	{nDamageBase = 100*0.8, nDamageRand = 100*0.4, nCostMana = 38},		--level 9		40-44
	{nDamageBase = 100*0.8, nDamageRand = 100*0.4, nCostMana = 38},		--level 10		45-49
	{nDamageBase = 100*0.8, nDamageRand = 100*0.4, nCostMana = 38},		--level 11		50-54
	{nDamageBase = 100*0.8, nDamageRand = 100*0.4, nCostMana = 38},		--level 12		55-59	                                           
	{nDamageBase = 100*0.8, nDamageRand = 100*0.4, nCostMana = 38},		--level 13		60-64
	{nDamageBase = 100*0.8, nDamageRand = 100*0.4, nCostMana = 38},		--level 14		65-69
	{nDamageBase = 100*0.8, nDamageRand = 100*0.4, nCostMana = 38},		--level 15		70-74
	{nDamageBase = 100*0.8, nDamageRand = 100*0.4, nCostMana = 38},		--level 16		75-79
	{nDamageBase = 100*0.8, nDamageRand = 100*0.4, nCostMana = 38},		--level 17		80-84
	{nDamageBase = 100*0.8, nDamageRand = 100*0.4, nCostMana = 38},		--level 18		85-89
	{nDamageBase = 100*0.8, nDamageRand = 100*0.4, nCostMana = 38},		--level 19		90-94
	{nDamageBase = 100 * 0.8, nDamageRand = 100 * 0.4, nCostMana = 38}, --level 20		95-99
	{nDamageBase = 15000*0.8, nDamageRand = 15000*0.4, nCostMana = 38},		--level 21  ���ɻ
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
--	skill.BindBuff(1,tSkillData[dwSkillLevel].nDebuffID, tSkillData[dwSkillLevel].nDebuffLevel)

    
    
	
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

    skill.nMinRadius		= 0											--����ʩ����С�뾶
    skill.nMaxRadius        = 5 * LENGTH_BASE;		-- ����ʩ�ŵ�������
    skill.nAngleRange       = 256; 									--ʩ�ŽǶ�
    skill.nAreaRadius       = 10 * LENGTH_BASE;

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
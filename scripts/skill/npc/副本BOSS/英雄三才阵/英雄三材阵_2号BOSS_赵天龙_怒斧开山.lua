------------------------------------------------
-- �ļ���    :  Ӣ��������_2��BOSS_������_ŭ����ɽ.lua
-- ������    :  �²���
-- ����ʱ��  :  2009-5-13
-- ��;(ģ��):  ����С��
-- �书����  :  Ӣ������
-- �书����  :  �⹦
-- �书��·  :  
-- ��������  :  
-- ����Ч��  :  ����������˺�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
     {nDamageBase = 205  *0.8,  nDamageRand = 205  *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 3, nTime= 48},
     {nDamageBase = 347  *0.8,  nDamageRand = 347  *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 3, nTime= 48},
     {nDamageBase = 498  *0.8,  nDamageRand = 498  *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 3, nTime= 48},
     {nDamageBase = 724  *0.8,  nDamageRand = 724  *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 3, nTime= 56},
     {nDamageBase = 951  *0.8,  nDamageRand = 951  *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 4, nTime= 56},
     {nDamageBase = 1308 *0.8,  nDamageRand = 1308 *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 4, nTime= 64},
     {nDamageBase = 1560 *0.8,  nDamageRand = 1560 *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 4, nTime= 64},
     {nDamageBase = 1811 *0.8,  nDamageRand = 1811 *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 4, nTime= 72},
     {nDamageBase = 2063 *0.8,  nDamageRand = 2063 *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 4, nTime= 72},
     {nDamageBase = 2314 *0.8,  nDamageRand = 2314 *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 4, nTime= 72},
     {nDamageBase = 2566 *0.8,  nDamageRand = 2566 *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 5, nTime= 80},
     {nDamageBase = 2818 *0.8,  nDamageRand = 2818 *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 5, nTime= 80},
     {nDamageBase = 3069 *0.8,  nDamageRand = 3069 *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 5, nTime= 80},
     {nDamageBase = 3321 *0.8,  nDamageRand = 3321 *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 5, nTime= 80},
     {nDamageBase = 3573 *0.8,  nDamageRand = 3573 *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 5, nTime= 80},
     {nDamageBase = 3824 *0.8,  nDamageRand = 3824 *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 5, nTime= 80},
     {nDamageBase = 4076 *0.8,  nDamageRand = 4076 *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 5, nTime= 80},
     {nDamageBase = 4327 *0.8,  nDamageRand = 4327 *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 5, nTime= 80},
     {nDamageBase = 4579 *0.8,  nDamageRand = 4579 *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 5, nTime= 80},
     {nDamageBase = 4831 *0.8,  nDamageRand = 4831 *0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 5, nTime= 80},

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
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0, 
		0
	);
 
    skill.AddAttribute(
	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
	ATTRIBUTE_TYPE.CALL_KNOCKED_DOWN,
	tSkillData[dwSkillLevel].nTime,
        0
    );
	
 skill.BindBuff(1,tSkillData[dwSkillLevel].nBuffID, tSkillData[dwSkillLevel].nBuffLevel);		-- ����1��λBuff      
    
	
    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab

    --skill.SetPublicCoolDown(16);	--����CD
   --skill.SetNormalCoolDown(2, 126);
	

	----------------- ���ü������� ---------------------------------------------------------------------
	skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
    ----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius		= 5 * LENGTH_BASE;		-- ����ʩ�ŵ������� 
	
    skill.nAreaRadius        = 6 * LENGTH_BASE;   --����ʩ�ŷ�Χ����
    skill.nAngleRange       = 128;  --ʩ�ŽǶ�
  -- skill.nTargetCountLimit	= 3;	-- �޶�����Ŀ��Ϊ4��
    
   -- skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    
 	--skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    
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
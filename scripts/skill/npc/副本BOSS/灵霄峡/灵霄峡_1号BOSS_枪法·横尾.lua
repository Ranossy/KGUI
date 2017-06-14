------------------------------------------------
-- �ļ���    :  ����Ͽ_1��BOSS_ǹ������β.lua
-- ������    :  �²���
-- ����ʱ��  :  2009-3-10
-- ��;(ģ��):  ����С��
-- �书����  :  ����Ͽ
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
     {nDamageBase = 127*0.8, nDamageRand =127*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 2, nTime= 24},
     {nDamageBase = 213*0.8,  nDamageRand = 213*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 2, nTime= 28},
     {nDamageBase = 320*0.8,  nDamageRand = 320*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 2, nTime= 32},
     {nDamageBase = 465*0.8,  nDamageRand = 465*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 2, nTime= 36},
     {nDamageBase = 611*0.8,  nDamageRand = 611*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 3, nTime= 40},
     {nDamageBase = 804*0.8,  nDamageRand = 804*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 3, nTime= 48},
     {nDamageBase = 1014*0.8,  nDamageRand = 1014*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 3, nTime= 48},
     {nDamageBase = 1178*0.8,  nDamageRand = 1178*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 3, nTime= 50},
     {nDamageBase = 1342*0.8,  nDamageRand = 1342*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 3, nTime= 50},
     {nDamageBase = 1505*0.8,  nDamageRand = 1505*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 3, nTime= 52},
     {nDamageBase = 1669*0.8,  nDamageRand = 1669*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 3, nTime= 52},
     {nDamageBase = 1833*0.8,  nDamageRand = 1833*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 3, nTime= 54},
     {nDamageBase = 1996*0.8,  nDamageRand = 1996*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 3, nTime= 54},
     {nDamageBase = 2160*0.8,  nDamageRand = 2160*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 3, nTime= 56},
     {nDamageBase = 2324*0.8,  nDamageRand = 2324*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 4, nTime= 56},
     {nDamageBase = 2487*0.8,  nDamageRand = 2487*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 4, nTime= 56},
     {nDamageBase = 2651*0.8,  nDamageRand = 2651*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 4, nTime= 60},
     {nDamageBase = 2815*0.8,  nDamageRand = 2815*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 4, nTime= 60},
     {nDamageBase = 2978*0.8,  nDamageRand = 2978*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 4, nTime= 60},
     {nDamageBase = 3142*0.8,  nDamageRand = 3142*0.4, nCostMana = 0,nBuffID = 994, nBuffLevel = 4, nTime= 62},
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
	
	
    skill.nWeaponDamagePercent = 0;
	----------------- ���ü������� ---------------------------------------------------------------------
	skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
    skill.nMinRadius		= 0											--����ʩ����С�뾶
    skill.nMaxRadius        = 5 * LENGTH_BASE;		-- ����ʩ�ŵ�������

    skill.nAreaRadius        = 3 * LENGTH_BASE;   --����ʩ�ŷ�Χ����
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
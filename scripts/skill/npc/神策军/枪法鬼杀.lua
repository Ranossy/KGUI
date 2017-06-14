------------------------------------------------

-- ������    :  �º���	
-- ����ʱ��  :  2008-8-21
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  ����
-- ��������  :  Ħڭ����
-- ����Ч��  :  �ж�ʩ������ɵ
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
   {nCostMana = 36},
	 {nCostMana = 67},
	 {nCostMana = 97},
	 {nCostMana = 120},
	 {nCostMana = 157},
	 {nCostMana = 187},
	 {nCostMana = 213},
	 {nCostMana = 225},
	 {nCostMana = 235},
	 {nCostMana = 243},
	 {nCostMana = 250},
	 {nCostMana = 278},
	 {nCostMana = 305},
	 {nCostMana = 332},
	 {nCostMana = 360}
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel
	

    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_BUFF,
        504, 
        1
    );
    
    
	
    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    --skill.SetPublicCoolDown(16);	--����CD
	  --skill.SetNormalCoolDown(2, 67);
	--������λ
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- ���ü������� ---------------------------------------------------------------------
	skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nWeaponDamagePercent = 0

    skill.nMinRadius		= 0										--����ʩ����С�뾶
    skill.nMaxRadius        = 4 * LENGTH_BASE;						--����ʩ�����뾶
    skill.nAngleRange       = 85; 									--ʩ�ŽǶ�
    
    skill.nPrepareFrames    = 0;									--����֡��,16֡����1��
    
 	skill.nBulletVelocity   = 0;									--�ӵ��ٶ�,��/֡
    
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
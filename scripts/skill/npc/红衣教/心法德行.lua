------------------------------------------------
--NPC�ļ�Ѫ����
--��ǿ��
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
   {nCostMana = 36 , nTherapy = 45 },
	 {nCostMana = 67 , nTherapy = 65 },
	 {nCostMana = 97 , nTherapy = 81 },
	 {nCostMana = 120, nTherapy = 173},
	 {nCostMana = 157, nTherapy = 254},
	 {nCostMana = 187, nTherapy = 328},
	 {nCostMana = 213, nTherapy = 398},
	 {nCostMana = 225, nTherapy = 475},
	 {nCostMana = 235, nTherapy = 556},
	 {nCostMana = 243, nTherapy = 612},
	 {nCostMana = 250, nTherapy = 662},
	 {nCostMana = 278, nTherapy = 736},
	 {nCostMana = 305, nTherapy = 808},
	 {nCostMana = 332, nTherapy = 878},
	 {nCostMana = 360, nTherapy = 952},
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local dwSkillLevel	= skill.dwLevel;
	
	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
        ATTRIBUTE_TYPE.SKILL_THERAPY,
        tSkillData[dwSkillLevel].nTherapy,
        0
    );

		skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.CALL_THERAPY,
        0,
        0
    );
	
    ----------------- ����CoolDown ---------------------------------------------------------------------
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    skill.SetPublicCoolDown(16);		--����CD1��
	
	----------------- ���ü������� ---------------------------------------------------------------------
	skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	
    ----------------- ����������� ----------------------------------------------------------------------
   
    --skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

    --skill.nMinRadius		= 0											--����ʩ����С�뾶
    skill.nMaxRadius        = 20 * LENGTH_BASE;							--����ʩ�����뾶
    skill.nAngleRange       = 256; 										--ʩ�ŽǶ�,ȫ��256
    
    skill.nPrepareFrames    = 32;										--����֡��,16֡����1��
    
 	skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    
    skill.nBreakRate        = 1024;									--����ϵĸ���,Ĭ��1024��ʾһ�������
   
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
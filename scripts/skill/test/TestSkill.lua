Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
    
    
    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.DASH, 
        120, 
        0
    );

	--���ü��ܹ���������λ
    skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER;
    
    --��������Ч��
    skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_ON_MAJOR_WEAK, 
        ATTRIBUTE_TYPE.CALL_BUFF, 
        422, 
        1
    );
	    
    ----------------- ����Debuff ------------------------------------------
    
	--skill.BindDebuff(1);
    
    ----------------- ����Dot --------------------------------------------

	--skill.BindDot(1);

    ----------------- ����Hot ---------------------------------------------
    

	--skill.BindHot(1);

    ----------------- ����Cool down ---------------------------------------
    
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    
    --skill.SetNormalCoolDown(1, 2);

    
    ----------------- ����������� ----------------------------------------
   
    --��������
    skill.dwLevelUpExp      = dwSkillLevel * 10 + 100;    
    --skill.dwExpAdd					= 30;
    --��������
    skill.nCostMana         = dwSkillLevel / 2 + 3;       
    --�����뾶��Ҳ���ǹ�������Ч����
		skill.nMinRadius 		= 0;
    skill.nMaxRadius        = (30 + dwSkillLevel * 2) * LENGTH_BASE;    
    
    skill.nAreaRadius       = 50 * LENGTH_BASE;
    
    skill.nAngleRange       = 256;
    
    --����֡��
    skill.nPrepareFrames    = 0;
    --�ӵ��ٶ�,��λ: ���� / ��
    skill.nBulletVelocity   = 0 * LENGTH_BASE;
    --����ϵĸ���
    skill.nBreakRate        = 0.3 * PERCENT_BASE;
	
	--ͨ��������ʱ�����----
	skill.nChannelFrame     = 60 * GAME_FPS;
	skill.nChannelInterval  = 2 * GAME_FPS;
    
    
   
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

--������ħ������ִ�нű�ʱ,Ҫ ���õĺ���; dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	--print("����, FOR TEST;(Apply)")
end

function UnApply(dwCharacterID)
	--print("����, FOR TEST;(UnApply)")
end


 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
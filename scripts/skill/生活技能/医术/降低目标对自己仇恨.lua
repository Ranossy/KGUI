--�������⿡�ҽ��BUFF�༼��
--hanzhengchun
--10.5.16

--------------�Ҳ��Ƿָ���----------------------------------------------------

tSkillData =
{

};

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--�����书���������ֵ
function GetSkillLevelData(skill)
    
	local dwSkillLevel = skill.dwLevel;
--����Buff---------	

	skill.AddAttribute(
        ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
        ATTRIBUTE_TYPE.MODIFY_THREAT_PERCENT, 
      	922,
        1
    );
	
--����cool down------

--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab----------------

     skill.SetNormalCoolDown(1,364);
     --skill.SetNormalCoolDown(2,133);
	
--������������-------
----------------- ʩ�ž��� -------------------------------------------------
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius		= 20 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 128;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶 
    --skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
   
    return true;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--npc: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(npc, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
    return nPreResult;
end



 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
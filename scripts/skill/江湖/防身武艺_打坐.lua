--������Ե������� ǧ������ һͳ����
--�书����
--��������-�����书-����
--����Ч����˵�������ü��ܣ��ӿ�ظ���Ѫ���������ٶȡ�
--���� 2007-1-3

--------------����ķָ���-----------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")



--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local bRetCode     = false;
	local dwSkillLevel = skill.dwLevel;
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.SIT,
		0,
		0
	);
	
	-- ��Ѫ�����Ĵ���BUFF
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		103,
		1
	);
	
   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,			
   		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								
   		"skill/����/��������_����.lua",				
   		0														
   		);
    ----------------- ����Cool down ---------------------------------------
	skill.AddSlowCheckSelfBuff(6279, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
	skill.AddSlowCheckSelfBuff(8265, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);	--���ƶ�ǽ
	skill.AddSlowCheckSelfBuff(10821, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);	--������������
	skill.AddSlowCheckSelfBuff(10819, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);--���˱���BUFF
	skill.AddSlowCheckSelfBuff(11077, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);	--�Ե�����ת
    --SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
    
    skill.SetNormalCoolDown(1, 192);			--��������CD1.5��
    skill.SetCheckCoolDown(1, 444)
	
    ----------------- ����������� ----------------------------------------
   
    --��������
    --skill.dwLevelUpExp      = tSkillData[dwSkillLevel].nLevelUpExp;    

    --�����뾶��Ҳ���ǹ�������Ч����
    --skill.nMaxRadius        = 2 * LENGTH_BASE;
    --skill.nAngleRange       = 128; 
    --����֡��
    skill.nPrepareFrames    = 0;
    --�ӵ��ٶ�
    --skill.nBulletVelocity   = 
    --����ϵĸ���
    skill.nBreakRate        = 1024;
   
    return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
    return nPreResult;
end

function OnSkillLevelUp(skill, player)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)	
	local player = GetPlayer(dwCharacterID)
	if not player then 	
		return
	end
	local Kungfu = player.GetKungfuMount()
	if not Kungfu then 
		return
	end
	if Kungfu.dwSkillID == 10002 or  Kungfu.dwSkillID == 10003 then	--���ִ����ض�
		player.AddBuff(0, 99, 4674, 1)
	end
end

-- Ŀ����Ϊ�˱�֤�ڴ����н���ս�������е������buffʱʱ������վ��
function UnApply(dwCharacterID)
	if IsPlayer(dwCharacterID) then
		local player = GetPlayer(dwCharacterID)
		
		if player.nMoveState == MOVE_STATE.ON_SIT then
			player.Stand()
		end
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com
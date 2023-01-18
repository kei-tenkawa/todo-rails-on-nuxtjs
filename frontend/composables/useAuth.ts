import type { Ref } from 'vue'
import type { User } from "types/index"

interface UserParams {
  email: string,
  password: string
}

export const useAuth = () => {
  const currentUser = useState('currentUser', () => null)
  const errors = useState("error", () => [])
  const message = useState("message", () => "")

  const login = (params: Ref<UserParams>) =>  async () => {
    const { currentUser, errors, message } = await useFetch("/api/v1/session", { params })
    // middleware でログインページにリダイレクトした場合は redirectFrom に元のページが入っている
    const to = useRoute().redirectedFrom?.path || '/'
    useRouter().push(to)
  }

  const logout = (currentUser: Ref<boolean>) => async () => {
    currentUser.value = false
  }


  return {
    currentUser,
    login: login(params),
    logout: logout(currentUser),
  }

}